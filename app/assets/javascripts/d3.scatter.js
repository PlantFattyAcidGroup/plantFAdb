(function() {
  d3.scatter = function() {
    var width = 1,
      height = 1,
      element = null,
      ylabel = 'Y-Axis',
      yDomain = null,
      xDomain = null,
      xAxisPadding = 10,
      categoryMethod = null
    var margin = {top: 30, right: 50, bottom: 150, left: 80};
    
    function chart(selection) {
      selection.each(function(g){
        var me = this;
                
        // Get data stats
      	var min = d3.min(g.map(function(d){
      		return d3.min(d.values.map(function(d){return parseFloat(d)}))
      	}))
      	var max = d3.max(g.map(function(d){
      		return d3.max(d.values.map(function(d){return parseFloat(d)}))
      	}))
      	var maxCount = d3.max(g.map(function(d){
      		return d.values.length
      	}))

          
        var hoverEl = d3.select(me).append("div")
        .style('display','none')
        .style('position','absolute')
        .attr('class','well')
        
        var svg = d3.select(me).append("svg")
        .attr("width", width)
        .attr("height", height )
        .append("g")
        .attr("transform", "translate(" + margin.left + "," + margin.top + ")")
        .style('pointer-events','all')

        
        console.log(hoverEl)
        
        // the x-domain
        xDomain = d3.scale.ordinal()	   
        .domain( g.map(function(d) { return d.object[categoryMethod] } ) )	    
        //.rangeRoundBands([0 , width], 0.35, .5);
        .rangeRoundBands([0 , width-margin.right-margin.left], 0.35, .5);
        
        yCountDomain = d3.scale.linear()	   
        .domain( [0,maxCount] )	    
        .range([height - margin.bottom, margin.top]);    

        // the y-domain
        yDomain = d3.scale.linear()
        .domain([min, max])
        .range([height - margin.bottom, margin.top]);
        
        // draw y axis
        var yAxis = d3.svg.axis()
        .scale(yDomain)
        .orient("left");

        svg.append("g")
        .attr("class", "y axis")
        .call(yAxis)
        .append("text") // and text1
        .attr("transform", "rotate(-90)")
        .attr("dy", "-2.5em")
        .attr("dx",-margin.top)
        .style("text-anchor", "end")
        .style("font-size", "12px") 
        .text(ylabel);		
        
        // // draw y count axis
        // var yCountAxis = d3.svg.axis()
        // .scale(yCountDomain)
        // .orient("right")
        // .tickFormat(d3.format("d"))
        //   .tickSubdivide(0);
        //
        // svg.append("g")
        // .attr("class", "y axis")
        // .attr("transform", "translate("+(width-margin.right-margin.left)+",0)")
        // .call(yCountAxis)
        // .append("text")
        // .attr("transform", "rotate(-90)")
        // .attr("dy", "3em")
        // .attr("dx",-margin.top)
        // .style("text-anchor", "end")
        // .style("font-size", "12px")
        // .text('Count');
        
        // draw x axis	
        var xAxis = d3.svg.axis()
        .scale(xDomain)
        .orient("bottom");
        
        var xAxis = svg.append("g")
        .attr("class", "x axis")
        .attr("transform", "translate(0," + (height - margin.bottom + xAxisPadding) + ")")
        .call(xAxis)
      
        xAxis.selectAll("text")
        .attr("y",0)
        .attr("x", "-.25em")
        .attr("dy", "1.1em")
        .attr("transform", "rotate(-35)")
        .style("text-anchor", "end");
      
        var scatterGroup = svg.selectAll(".scatter")
          .data(g)
          .enter().append("g")
          .attr('class','scatter')
          .attr("transform", function(d) { return "translate(" +  xDomain(d.object[categoryMethod])  + ",0)"; } )
        scatterGroup.append("rect")
          .attr('x',0)
          .attr('y',0)
          //.attr('y',function(d){return yCountDomain(d.values.length)})
          .attr('width',xDomain.rangeBand())
          .attr('height',function(d){
            
            //return height-margin.bottom+xAxisPadding-yCountDomain(d.values.length)
            return height-margin.bottom+xAxisPadding;
          })
        .on('mouseover',function(d){
          var me = d3.select(this)
          me.style('stroke','#ccc')
          setHoverMessage(d,hoverEl);
        })
        .on('mouseout',function(d){
          var me = d3.select(this)
          me.style('stroke','none')
          clearHoverMessage(hoverEl);
        })
        .on('mousemove',function(){setHoverPosition(hoverEl,svg)})
        .on('click',function(d){
          handleClick(d)
        })
        svg.on('click',function(d){
          clearHoverMessage(hoverEl);
        })
        scatterGroup.call(draw);
      })

    }
    
    draw = function(selection){
      selection.each(function(data, i) {
        var d = data.values.map(function(d){return parseFloat(d)})//.sort(d3.ascending);  
        
        var points = d3.select(this).selectAll("ellipse.point")
        .data(d);

        points.enter().insert("ellipse", "text")
        .attr("class", "point")
        .attr("rx", 5)
        .attr("ry", 5)
        .attr("cx",xDomain.rangeBand()/2 )
        .attr("cy", function(d) { return yDomain(d); })
      })
    }
    
		setHoverPosition = function(hoverEl,svg){
			var coord = d3.mouse(svg.node())
			hoverEl.style('right',Math.min(parseInt(width-coord[0]-margin.left+3),width-margin.left-margin.right-100)+'px')
			.style('bottom',parseInt(height-coord[1]-margin.top+3)+'px')
		}
    
    setHoverMessage = function(d,hoverEl){
      var text = d.object[categoryMethod]+' : '
      text += d.values.length+' datapoint'+(d.values.length>1 ? 's' : '')
      hoverEl.style('display','')
      .text(text)
    }
    
    clearHoverMessage = function(hoverEl){
      hoverEl.style('display','none')
    }
    
    handleClick = function(){};
    
    chart.width = function(x) {
      if (!arguments.length) return width;
      width = x;
      return chart;
    };

    chart.height = function(x) {
      if (!arguments.length) return height;
      height = x;
      return chart;
    };

    chart.domain = function(x) {
      if (!arguments.length) return domain;
      domain = x;
      return chart;
    };
    
    chart.element = function(x) {
      if (!arguments.length) return element;
      element = x;
      return chart;
    };
    
    chart.margin = function(x) {
      if (!arguments.length) return margin;
      margin = x;
      return chart;
    };
    
    chart.ylabel = function(x) {
      if (!arguments.length) return ylabel;
      ylabel = x;
      return chart;
    };
    
    chart.categoryMethod = function(x) {
      if (!arguments.length) return categoryMethod;
      categoryMethod = x;
      return chart;
    };
    
    chart.hoverMessage = function(x){
      if (!arguments.length) return setHoverMessage;
      setHoverMessage = x;
      return chart;
    };
    
    chart.click = function(x){
      if (!arguments.length) return handleClick;
      handleClick = x;
      return chart;
    };
    
    return chart;
  };

})();

