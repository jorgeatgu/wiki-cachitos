const line = (csvFile, chapter, day) => {
    const margin = { top: 24, right: 24, bottom: 24, left: 48 };
    let width = 0;
    let height = 0;
    const chart = d3.select(`.line-${chapter}`);
    const svg = chart.select('svg');
    const scales = {};
    let dataz;
    const parseTime = d3.timeParse('%Y-%m-%d');
    let tooltipOver;

    const setupScales = () => {
        const countX = d3.scaleTime().domain(d3.extent(dataz, (d) => d.dia));

        const countY = d3
            .scaleLinear()
            .domain([0, d3.max(dataz, (d) => d.visitas * 1.25)]);

        scales.count = { x: countX, y: countY };
    };

    const setupElements = () => {
        const g = svg.select(`.line-${chapter}-container`);

        g.append('g').attr('class', 'axis axis-x');

        g.append('g').attr('class', 'axis axis-y');

        g.append('g').attr('class', `line-${chapter}-container-dos`);
    };

    const updateScales = (width, height) => {
        scales.count.x.range([0, width]);
        scales.count.y.range([height, 0]);
    };

    const drawAxes = (g) => {
        const axisX = d3
            .axisBottom(scales.count.x)
            .tickFormat(d3.timeFormat('%m-%d'))
            .ticks(13);

        g.select('.axis-x')
            .attr('transform', `translate(0,${height})`)
            .call(axisX);

        const axisY = d3
            .axisLeft(scales.count.y)
            .tickFormat(d3.format('d'))
            .ticks(5)
            .tickSizeInner(-width);

        g.select('.axis-y').call(axisY);
    };

    const tooltips = (data) => {

        chart.select('.tooltip').remove();

        tooltipOver = chart
            .append('div')
            .attr('class', 'tooltip tooltip-cachitos');


        const buildTooltip = (d) => {
            if (dataz[0].diferencia > 0) {
                tooltipOver
                    .data(dataz)
                    .html(
                        (d) =>
                            `
                        <p class="tooltip-text">El día de la emisión las visitas aumentaron en un: <span class="tooltip-number">${d.diferencia}%</span></p>

                        `
                    )
                    .transition()
                    .duration(300);

            } else {
                tooltipOver
                    .attr('class', 'tooltip tooltip-negative')
                    .data(dataz)
                    .html(
                        (d) =>
                            `
                        <p class="tooltip-text">El día de la emisión las visitas descendieron en un: <span class="tooltip-number">${d.diferencia}%</span></p>

                        `
                    )
                    .transition()
                    .duration(300);
            }
        }

        buildTooltip();

            };

    const updateChart = (dataz) => {
        const w = chart.node().offsetWidth;
        const h = 600;

        width = w - margin.left - margin.right;
        height = h - margin.top - margin.bottom;

        svg.attr('width', w).attr('height', h);

        const translate = `translate(${margin.left},${margin.top})`;

        const g = svg.select(`.line-${chapter}-container`);

        g.attr('transform', translate);

        const line = d3
            .line()
            .x((d) => scales.count.x(d.dia))
            .y((d) => scales.count.y(d.visitas));

        updateScales(width, height);

        const container = chart.select(`.line-${chapter}-container-dos`);

        const layer = container.selectAll('.line').data([dataz]);

        const newLayer = layer
            .enter()
            .append('path')
            .attr('class', 'line')
            .attr('stroke-width', '1.5');

        const dots = container.selectAll('.circles').data(dataz);

        const dotsLayer = dots
            .enter()
            .append('circle')
            .attr('class', 'circles');

        layer
            .merge(newLayer)
            .transition()
            .duration(600)
            .ease(d3.easeLinear)
            .attr('d', line);

        dots.merge(dotsLayer)
            .transition()
            .duration(600)
            .ease(d3.easeLinear)
            .attr('cx', (d) => scales.count.x(d.dia))
            .attr('cy', (d) => scales.count.y(d.visitas))
            .attr('r', (d) => {
                if (d.fecha === day) {
                    return 5;
                } else {
                    return 0;
                }
            });

        drawAxes(g);
    };

    function update(artist) {
        d3.csv(csvFile, (data) => {
            dataz = data;

            let artist = d3.select(`#select-${chapter}`).property('value');

            dataz = dataz.filter((d) => String(d.artista).match(artist));

            dataz.forEach((d) => {
                d.nombre = d.artista;
                d.visitas = +d.visitas;
                d.dia = parseTime(d.fecha);

                setupScales();
            });

            tooltips(dataz);

            updateChart(dataz);
        });
    }

    const menuArtist = () => {
        d3.csv(csvFile, (data) => {
            const nest = Array.from(
                d3.group(data, (d) => d.artista),
                ([key, value]) => ({
                    key,
                    value
                })
            );

            const selectCity = d3.select(`#select-${chapter}`);

            selectCity
                .selectAll('option')
                .data(nest)
                .enter()
                .append('option')
                .attr('value', (d) => d.key)
                .text((d) => d.key);

            selectCity.on('change', function() {
                let artist = d3.select(this).property('value');
                update(artist);
            });
        });
    };

    const resize = () => {
        updateChart(dataz);
    };

    const loadData = () => {
        d3.csv(csvFile, (data) => {
            const artista = data[0].artista;
            dataz = data.filter((d) => String(d.artista).match(artista));
            dataz.forEach((d) => {
                d.nombre = d.artista;
                d.visitas = +d.visitas;
                d.dia = parseTime(d.fecha);
            });

            console.log(dataz)

            menuArtist();
            setupElements();
            setupScales();
            tooltips(dataz);
            updateChart(dataz);
        });
    };

    window.addEventListener('resize', resize);

    loadData();
};

let prueba = ['csv/episodio-uno.csv', 'chapter-one', '2019-05-28'];

line(prueba[0], prueba[1], prueba[2]);

const cachitos = [
    ['csv/episodio-uno.csv', 'chapter-one', '2019-04-23'],
    ['csv/episodio-dos.csv', 'chapter-two', '2019-05-21'],
    ['csv/episodio-tres.csv', 'chapter-three', '2019-05-28'],
    ['csv/episodio-cuatro.csv', 'chapter-four', '2019-06-04'],
    ['csv/episodio-cinco.csv', 'chapter-five', '2019-06-11'],
    ['csv/episodio-seis.csv', 'chapter-six', '2019-06-18'],
    ['csv/episodio-siete.csv', 'chapter-seven', '2019-06-25']
];

for (const args of cachitos) line(...args);

new SlimSelect({
    select: '#select-chapter-one',
    searchPlaceholder: 'Selecciona una artista...'
});

new SlimSelect({
    select: '#select-chapter-two',
    searchPlaceholder: 'Selecciona una artista...'
});

new SlimSelect({
    select: '#select-chapter-three',
    searchPlaceholder: 'Selecciona una artista...'
});

new SlimSelect({
    select: '#select-chapter-four',
    searchPlaceholder: 'Selecciona una artista...'
});

new SlimSelect({
    select: '#select-chapter-five',
    searchPlaceholder: 'Selecciona una artista...'
});

new SlimSelect({
    select: '#select-chapter-six',
    searchPlaceholder: 'Selecciona una artista...'
});

new SlimSelect({
    select: '#select-chapter-seven',
    searchPlaceholder: 'Selecciona una artista...'
});
