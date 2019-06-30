const line = () => {
    const margin = { top: 24, right: 24, bottom: 24, left: 48 };
    let width = 0;
    let height = 0;
    const chart = d3.select('.line-artist');
    const svg = chart.select('svg');
    const scales = {};
    let dataz;
    const parseTime = d3.timeParse('%Y-%m-%d');

    const setupScales = () => {
        const countX = d3.scaleTime().domain(d3.extent(dataz, (d) => d.dia));

        const countY = d3
            .scaleLinear()
            .domain([0, d3.max(dataz, (d) => d.visitas * 1.25)]);

        scales.count = { x: countX, y: countY };
    };

    const setupElements = () => {
        const g = svg.select('.line-artist-container');

        g.append('g').attr('class', 'axis axis-x');

        g.append('g').attr('class', 'axis axis-y');

        g.append('g').attr('class', 'line-artist-container-dos');
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

    const updateChart = (dataz) => {
        const w = chart.node().offsetWidth;
        const h = 600;

        width = w - margin.left - margin.right;
        height = h - margin.top - margin.bottom;

        svg.attr('width', w).attr('height', h);

        const translate = `translate(${margin.left},${margin.top})`;

        const g = svg.select('.line-artist-container');

        g.attr('transform', translate);

        const line = d3
            .line()
            .x((d) => scales.count.x(d.dia))
            .y((d) => scales.count.y(d.visitas));

        updateScales(width, height);

        const container = chart.select('.line-artist-container-dos');

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

        layer.merge(newLayer)
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
                if (d.fecha === '2019-05-21') {
                    return 5;
                } else {
                    return 0;
                }
            });

        drawAxes(g);
    };

    function update(artist) {
        d3.csv('csv/episodio-dos.csv', (error, data) => {
            dataz = data;

            console.log('funcion update')

            let artist = d3.select('#select-artist').property('value');

            dataz = dataz.filter((d) => String(d.artista).match(artist));

            dataz.forEach((d) => {
                d.nombre = d.artista;
                d.visitas = +d.visitas;
                d.dia = parseTime(d.fecha);

                setupScales();
            });

            updateChart(dataz);
        });
    }

    const menuArtist = () => {
        d3.csv('csv/episodio-dos.csv', (error, data) => {
            if (error) {
                console.log(error);
            } else {

                const nest = Array.from(
                    d3.group(data, (d) => d.artista),
                    ([key, value]) => ({
                        key,
                        value
                    })
                );

                const selectCity = d3.select('#select-artist');

                selectCity
                    .selectAll('option')
                    .data(nest)
                    .enter()
                    .append('option')
                    .attr('value', (d) => d.key)
                    .text((d) => d.key);

                selectCity.on('change', function() {
                    let artist = d3.select(this).property('value');
                    console.log('select cambiando')
                    update(artist);
                });
            }
        });
    };

    const resize = () => {
        updateChart(dataz);
    };

    const loadData = () => {
        d3.csv('csv/episodio-dos.csv', (error, data) => {
            if (error) {
                console.log(error);
            } else {
                const artista = 'Amaral';
                dataz = data.filter((d) => String(d.artista).match(artista));
                dataz.forEach((d) => {
                    d.nombre = d.artista;
                    d.visitas = +d.visitas;
                    d.dia = parseTime(d.fecha);
                });

                menuArtist();
                setupElements();
                setupScales();
                updateChart(dataz);
            }
        });
    };

    window.addEventListener('resize', resize);

    loadData();
};

line();

new SlimSelect({
    select: '#select-artist',
    searchPlaceholder: 'Selecciona una artista...'
});
