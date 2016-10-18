  d3.phylotree = function() {
    var tree = {};
  	var width = $("#tree").width();
  	var height = 1000;
  	var leftMargin = 5;
  	var rightMargin = 20;
  	var rightTextMargin = 150;
  	var histWidth =parseInt(width*.35);
  	var histRange = histWidth-rightMargin;
  	var histStart = width-histWidth;
  	var headerHeight = 45;
  	var boxOffset = -6;
  	var boxheight = 12;
  	var barOffset = -5;
  	var barheight = 10;
    var duration = 750;
    var valueMethod = 'totalCount';
    var element, data, hoverEl, nodeHoverEl, cluster, diagonal, currentRoot, baseSvg, root, svg, measureNode,dataFunc,dataClick;
    
  	// recursive data functions
  	var maxVal = function(d){ return d.max || d3.max((d.children||d._children||[]),function(child){return maxVal(child);});}
  	var avgVal = function(d){ return d.avg || d3.mean((d.children||d._children||[]),function(child){return maxVal(child);});}
  	var totalCount = function(d){ return d.count || d3.sum((d.children||d._children||[]),function(child){return totalCount(child);});}
  	var getColor = function(d){ return d.color || (d.parent ? getColor(d.parent) : '#222');}
  	var openOriginalChildren = function(d){ 
  		if(d._children && !d.loaded){
  			d.children=d._children;
  			d._children=null;
  		}
  		if(d.children){
  			if(d.loaded){
  				d._children = d.children;
  				d.children = null;
  			}else{
  				d.children.forEach(function(child){
  					openOriginalChildren(child);
  				});
  			}
  		}

  	}
    
    tree.draw = function(){
      hoverEl = d3.select(element).append("div")
      .style('display','none')
      .style('position','absolute')
      .attr('class','hover well')
	
      nodeHoverEl = d3.select("#tree").append("div")
      .style('display','none')
      .style('position','absolute')
      .attr('class','hover well')
      
    	baseSvg = d3.select("#tree").append("svg")
    	    .attr("width", width)
    	    .attr("height", height)
		
    	svg = baseSvg.append("g")
      	.attr("transform", "translate("+leftMargin+","+headerHeight+")");
	
    	measureNode = svg.append('text')
    				.attr('class','node')
    				.attr('visibility', 'hidden')
		
    	/// Vertical Line
    	baseSvg.append("line")
    	.attr("class", "separator")
    	.attr("x1",histStart+leftMargin-1)
    	.attr("y1",headerHeight)
    	.attr("x2",histStart+leftMargin-1)
    	.attr("y2",height)
		
    	// hist axis
    	baseSvg.append("g")
    		.attr("class", "x axis")
    		.attr("transform", "translate("+(leftMargin+histStart)+"," + (headerHeight-2) + ")")
		
    	cluster = d3.layout.cluster()
    	    .size([height-headerHeight, width - leftMargin - rightTextMargin - histWidth])
		
      diagonal = d3.svg.diagonal()
          .projection(function(d) { return [d.y, d.x]; });

    	root=data[0];
    	root.x0 = (height-headerHeight) / 2;
    	root.y0 = leftMargin;
      
    	currentRoot = root;
    	updateHeight();
    	update(root);
      return tree
    }
    
	
  	function update(source) {
  		cluster.size([height-headerHeight, width - leftMargin - rightTextMargin - histWidth])
  		// Compute the new tree layout.			
  	  var nodes = cluster.nodes(currentRoot);
  	  nodes[0].y += 35;
  		var links = cluster.links(nodes);
	
  		// Update Node Group				
  		var node = svg.selectAll("g.node")
        .data(nodes, function(d) { return d.id })
		
  		// Enter any new nodes at the parent's previous position.
  		var nodeEnter = node.enter().append("g")
        .attr("class", "node")
  			.attr("transform", function(d) { return "translate(" + source.y0 + "," + source.x0 + ")"; })
  			.on("click", function(d){
  				if(totalCount(d) > 0){nodeClick(d);}
  			})
  			.on("mouseover",function(d){
  				var el = d3.select(this);
  				el.style('font-size', function(d){
  					return (totalCount(d) > 0 && d.taxon.length < 3) ? '11px' : '10px'
  				});
  				el.style('cursor', function(d){
  					return (totalCount(d) > 0 && d.taxon.length < 3) ? 'pointer' : 'default'
  				});
  				setNodeHoverMessage(d);
  			})
  			.on("mouseout",function(){
  				var d = d3.select(this)
  				d.style('font-size', '10px')
  				d.style('cursor','default')
  				clearNodeHoverMessage();
  			})
  			.on('mousemove',function(){setNodeHoverPosition()})
			
  		nodeEnter.append("circle")
  			.attr("r", 1e-6)
  			.style('stroke',function(d){ return getColor(d); })
  			.style('fill',function(d){ return '#fff' })

  		// nodeEnter.append("rect")
  		// 	.attr("x",function(d){
  		// 		var offset = d.children ? -(3 + (measureNode.text(d.name).node().getComputedTextLength()+4)): 3
  		// 		return (d.y+offset) < 0 ? -d.y : offset
  		// 	})
  		// 	.attr("y", boxOffset)
  		// 	.attr("width",function(d){return (measureNode.text(d.name).node().getComputedTextLength()+4)})
  		// 	.attr("height", boxheight)
  		// 	.attr('stroke',function(d){
  		// 		return getColor(d);
  		// 	})
  		// 	.attr("fill",function(d){
  		// 		return getColor(d);
  		// 	})
  		// 	.style("fill-opacity", 1e-6)
  		// 	.style("stroke-opacity", 1e-6);
			
  		nodeEnter.append("text")
  			.attr("x",function(d){
  				var offset = d.children ? -(1 + (measureNode.text(d.name).node().getComputedTextLength()+4)): 5
  				return (d.y+offset) < 0 ? -(d.y-2) : offset
  			})
  			.attr("dy", 4)
  			.style("text-anchor", function(d) { return "start"})
  			.text(function(d) { return d.name; })
  			.style("fill-opacity", 1e-6)
		
  	  // Transition nodes
  	  var nodeUpdate = node.transition()
  	      .duration(duration)
  	      .attr("transform", function(d) { return "translate(" + d.y + "," + d.x + ")"; });
			
  	  nodeUpdate.select("circle")
  	      .attr("r", 5)
  				.style('fill',function(d){
  					// Definite children hidden
  					if(d._children || d.children || (d.count)){return getColor(d);}
  					else{return '#fff'}
  				})
  				.style("fill-opacity", function(d){
  					if(d.taxon.length>2&&d.count){
  						return 0
  					}else{
  						return 1
  					}
  				})
  				.style("stroke-opacity", function(d){
  					if(d.taxon.length>2&&d.count){
  						return 0
  					}else{
  						return 1
  					}
  				})
  		// nodeUpdate.select("rect")
  		// 		.style("fill-opacity", .5)
  		// 		.style("stroke-opacity", 1)
  		// 		.attr("x",function(d){
  		// 			var offset = d.children ? -(3 + (measureNode.text(d.name).node().getComputedTextLength()+4)): 3
  		// 			return (d.y+offset) < 0 ? -d.y : offset
  		// 		})
  	  nodeUpdate.select("text")
  	      .style("fill-opacity", 1)
  				.attr("x",function(d){
  					var offset = d.children ? -(1 + (measureNode.text(d.name).node().getComputedTextLength()+4)): 5
  					return (d.y+offset) < 0 ? -(d.y-2) : offset
  				})

  	  // Transition exiting nodes to the parent's new position.
  	  var nodeExit = node.exit().transition()
  	      .duration(duration)
  	      .attr("transform", function(d) { return "translate(" + source.y + "," + source.x + ")"; })
  	      .remove();

  	  nodeExit.select("circle")
  	      .attr("r", 1e-6);
  		// nodeExit.select("rect")
  		// 		.style("fill-opacity", 1e-6)
  		// 		.style("stroke-opacity", 1e-6);
  	  nodeExit.select("text")
  	      .style("fill-opacity", 1e-6);
				
  		// Update the links
  		var link = svg.selectAll("path.link")
  		    .data(links, function(d) { return d.target.id; })
  		link.enter().insert("path","g")
  		    .attr("class", "link")
  				.attr("d", function(d) {
  	        var o = {x: source.x0, y: source.y0};
  	        return diagonal({source: o, target: o});
  	      })
  				.attr('stroke',function(d){
  					return getColor(d.target);
  				})
  	  // Transition links to their new position.
  	  link.transition()
  	      .duration(duration)
  	      .attr("d", diagonal);
				
  	  // Transition exiting nodes to the parent's new position.
  	  link.exit().transition()
  	      .duration(duration)
  	      .attr("d", function(d) {
  	        var o = {x: source.x, y: source.y};
  	        return diagonal({source: o, target: o});
  	      })
  	      .remove();
		
  		/// Histogram
  		var leaf = svg.selectAll("g.leafnode")
  			.data(nodes.filter(function(d){ return d.children==null}),function(d){ return d.id})
		
  		var leafEnter = leaf.enter().append("g")
  			.attr("class","leafnode")
  			.on("click", dataClick)
        .on('mouseover',function(d){
          var me = d3.select(this)
          me.style('opacity',0.75)
          setHoverMessage(d);
        })
        .on('mouseout',function(d){
          var me = d3.select(this)
          me.style('opacity',1)
          clearHoverMessage();
        })
  			.on('mousemove',function(){setHoverPosition()})
			
  		var maxLeaf = d3.max(leaf.data(),function(d){return getValueFor(d)||1;})
  		var hx = d3.scale.linear()
  			.range([0,histRange])
  			.domain([0,maxLeaf])
		
  		var xAxis = d3.svg.axis()
  			.scale(hx)
  			.orient("top");
			
  		var aX = baseSvg.select('g.x.axis')
  			.call(xAxis);
			
  		leafEnter.append("rect")
  			.attr("class", "hidden-bar")
  			.attr("x", histStart)
  			.attr("width",0)
  			.attr("y", function(d) { return d.x+barOffset; })
  			.attr("height", 0)
			
  		leafEnter.append("rect")
  			.attr("class", "bar")
  			.attr("x", histStart)
  			.attr("width",0)//function(d){ return hx(maxVal(d)); })
  			.attr("y", function(d) { return d.x+barOffset; })
  			.attr("height", 0)
  			.style('fill', function(d){
  				return getColor(d);
  			})
  			.style('stroke','#444')
		
  		leaf.select('rect.hidden-bar')
  			.transition()
  			.duration(duration)
  			.attr("x", histStart)
  			.attr("width",function(d){ return hx(maxLeaf||0)})
  			.attr("y", function(d) { return d.x+barOffset; })
  			.attr("height", function(d) { return barheight; });
  		leaf.select('rect.bar')
  			.transition()
  			.duration(duration)
  			.attr("x", histStart)
  			.attr("width",function(d){ return hx(getValueFor(d)||0)})
  			.attr("y", function(d) { return d.x+barOffset; })
  			.attr("height", function(d) { return barheight; });	
			
  		var leafExit = leaf.exit()
  			.transition()
      	.duration(duration)
  			.remove();
  		leafExit.select('rect')
      	.attr("width", 0)
    
  		  // Stash the old positions for transition.
  		  nodes.forEach(function(d) {
  		    d.x0 = d.x;
  		    d.y0 = d.y;
  		  });
			
  	}
	
    function getValueFor(d){
      if(valueMethod=='totalCount'){
        return totalCount(d);
      }else{
        return maxVal(d);
      }
    }
  	function updateHeight(){
  		var nodes = cluster.nodes(currentRoot);
  		var leaves = nodes.filter(function(d){ return d.children==null});
  		height = leaves.length*(barheight*1.5)+headerHeight
  		height = d3.max([height,600])
  		baseSvg.transition()
      	.duration(duration)
  			.attr('height',height)
  		baseSvg.select('line.separator')
  			.transition()
      	.duration(duration)
  			.attr('y2',height)
  		return height
  	}
	
  	window.onresize = function(){
  		width = $(element).width();
  		baseSvg.attr('width',width);
  		histWidth =parseInt(width*.35);
  	 	histRange = histWidth-rightMargin
  		histStart = width-histWidth
		
  		baseSvg.select("line.separator")
  			.transition()
      	.duration(duration)
  			.attr("x1",histStart+leftMargin-1)
  			.attr("x2",histStart+leftMargin-1)
  		baseSvg.select("g.x.axis")
  			.transition()
      	.duration(duration)
  			.attr("transform", "translate("+(leftMargin+histStart)+"," + (headerHeight-2) + ")")
  		cluster.size([height-headerHeight, width - leftMargin - rightTextMargin - histWidth]);
  		update(root)
  	};
	
  	// Toggle children on click.
  	function nodeClick(d) {
  		// displayed children need collapse
  	  if (d.children) {

  			if(d == currentRoot){
  				//currentRoot = root
  				//currentRoot = d.parent ? (d.parent.parent ? d.parent.parent : d.parent) : d
  				currentRoot = d.parent ? d.parent : d
  			}else{
  		    d._children = d.children;
  		    d.children = null;
  				//if(currentRoot != root){currentRoot = d.parent ? (d.parent.parent ? d.parent.parent : d.parent) : d}
  			}
  	  } else {
  			// hidden children need show
  			if (d._children) {
  				currentRoot = d.parent ? (d.parent.parent ? d.parent.parent : d.parent) : d
  				//currentRoot = d.parent ? d.parent : d
  		    d.children = d._children;
  		    d._children = null;
  			} else {
  				// No more loading after genus,species
  				if(d.taxon.length > 2 || d.count == 0){return;}
  				// need to load children
  				d3.json(dataFunc(d),function(error,nodes){
  					d.children = nodes;
  					d.loaded = true;
  					currentRoot = d.parent ? (d.parent.parent ? d.parent.parent : d.parent) : d
  					//currentRoot = d.parent ? d.parent : d
  					updateHeight();
  					update(d);
  				})
  			}

  	  }
  		updateHeight();
  	  update(d);
  	}
	
  	tree.resetNodes = function() {
  		openOriginalChildren(root)
  		currentRoot = root;
  		updateHeight();
  		update(root);
  	}

	
  	setNodeHoverPosition = function(){
  		var coord = d3.mouse(baseSvg.node())
  		nodeHoverEl.style('left',parseInt(coord[0]+leftMargin)+'px')
  		.style('bottom',parseInt(height-coord[1])+'px')
  	}
	
    setNodeHoverMessage = function(d){
      var html = '<b>'+d.name+'</b><br/>'
      if(d.note){html += d.note+'<br/>';}
      nodeHoverEl.style('display','')
      .html(html)
		
    }
  
    clearNodeHoverMessage = function(){
      nodeHoverEl.style('display','none')
    }
			
  	setHoverPosition = function(){
  		var coord = d3.mouse(svg.node())
  		hoverEl.style('right',parseInt(width-coord[0]+rightMargin+3)+'px')
  		.style('bottom',parseInt(height-coord[1]-headerHeight+3)+'px')
  	}
	
    setHoverMessage = function(d){
		
      var html = '<b>'+d.name+'</b><br/>'
      if(valueMethod != 'totalCount'){
        html += 'Max Yield: '+(maxVal(d)||0).toFixed(2)+'%</br>'
  		  //html += 'Avg Yield: '+(avgVal(d)||0).toFixed(2)+'%</br>' 
      }
  		html += 'Datapoints: '+totalCount(d)||0
      hoverEl.style('display','')
      .html(html)
		
    }
  
    clearHoverMessage = function(){
      hoverEl.style('display','none')
    }
    
    tree.element = function(x) {
      if (!arguments.length) return element;
      element = x;
      return tree;
    };
    
    tree.data = function(x) {
      if (!arguments.length) return data;
      data = x;
      return tree;
    };
    
    tree.dataFunc = function(x) {
      if (!arguments.length) return dataFunc;
      dataFunc = x;
      return tree;
    };
    
    tree.valueMethod = function(x) {
      if (!arguments.length) return valueMethod;
      valueMethod = x;
      return tree;
    };
    
    tree.dataClick = function(x) {
      if (!arguments.length) return dataClick;
      dataClick = x;
      return tree;
    };
    
    return tree;
  };