class HomeController < ApplicationController
  skip_authorization_check
  def index
    @page = Page.find_by(title: 'home')
    # @fatty_acids = FattyAcid.with_results.order("measures.name asc")
    # @selected = FattyAcid.find_by(id: params[:measure]) if params[:measure]
    # @min = nil
    # @max = 0
    # @tree = TreeNode.arrange_serializable(:order => :id) do |parent, children|
    #   if children.empty?
    #     if params[:measure].blank?
    #       v1 = Result.joins(:measure, :plant)
    #       .where("measures.type ='FattyAcid'")
    #       .where("plants.order_name='#{parent.name}'")
    #       .count
    #     else
    #       v1 = Result.joins(:measure, :plant)
    #       .where("measures.id = ?", params[:measure])
    #       .where("plants.order_name = '#{parent.name}'")
    #       .maximum(:value).to_f.try(:round,3)
    #     end
    #     v1||=0
    #     # get leaf stats
    #     @min||=v1
    #     @max=v1 if v1 > @max
    #     @min=v1 if v1 < @min
    #   else
    #     v1 = 1
    #   end
    #   {
    #     id: parent.id,
    #     name: parent.name,
    #     common_name: parent.common_name,
    #     #value: Plant.where(order_name: parent.name).count,
    #     v1: v1,
    #     children: children
    #   }
    # end
  end
   
  def tree
    width = (params[:width]||800).to_i
    innerArc = (width/23).to_i
    xml_string = <<-XML
    <phyloxml xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.phyloxml.org http://www.phyloxml.org/1.10/phyloxml.xsd" xmlns="http://www.phyloxml.org">
    <phylogeny rooted="false">
    <render>
    <parameters>
    <circular>
    <bufferRadius>0.5</bufferRadius>
    </circular>
    <rectangular>
    <alignRight>1</alignRight>
    <bufferX>350</bufferX>
    </rectangular>
    </parameters>
    <charts>        
    <g6 type="binary" thickness="#{innerArc}" isInternal="true" bufferInner="0"/>
    <g5 type="binary" thickness="#{innerArc}" isInternal="true" bufferInner="#{innerArc}"/>
    <g4 type="binary" thickness="#{innerArc}" isInternal="true" bufferInner="#{innerArc*2}"/>
    <g3 type="binary" thickness="#{innerArc}" isInternal="true" bufferInner="#{innerArc*3}"/>
    <g2 type="binary" thickness="#{innerArc}" isInternal="true" bufferInner="#{innerArc*4}"/>
    <g1 type="binary" thickness="#{innerArc}" isInternal="true" bufferInner="#{innerArc*5}"/>
        
    <content type="bar" fill="#666" width=".50" />
    </charts>
    <styles>
    <caffeine fill='#A93' stroke='#DDD' />
    <base fill='#8b7100' stroke='#DDD' />
    <other fill='#333' stroke='#DDD' />
		
    <high fill='#666' stroke='#DDD' />
    <mid fill='#999' stroke='#DDD' />
    <low fill='#CCC' stroke='#DDD' />
    <none fill='#FFF' stroke='#CCC' />
		

    <barChart fill='#333' stroke-width="0" />
    <markgroupA fill="#000" stroke="#000" opacity="0.7" label="PEETS" labelStyle="sectorHighlightText" />
    <markgroupB fill="#000" stroke="#000" opacity="0.7" label="STARBUCKS" labelStyle="sectorHighlightText" />
        
        
    <grp_none fill="#444" opacity="0.0" stroke="#FFF" />
        
    <grp_root fill="#444" stroke="#FFF" />
    <grp_spermatophyte fill="#DDD" stroke="#FFF" label="SEED PLANTS" labelStyle="sectorHighlightTextFlip"/>
    <grp_gymnosperms fill="#B0744C" stroke="#FFF" />
    <grp_anita fill="#D3EEF5" stroke="#FFF" label="" labelStyle="sectorHighlightText"  />
    <grp_angiosperms fill="#D3EEF5" stroke="#FFF" label="ANGIOSPERMS" labelStyle="sectorHighlightTextFlip"  />
    <grp_magnoliids fill="#86C0CE" stroke="#FFF" label="" labelStyle="sectorHighlightText" />
    <grp_monocots fill="#B0D4B7" stroke="#FFF" label="MONOCOTS" labelStyle="sectorHighlightText" />
    <grp_commelinids fill="#63B384" stroke="#FFF" label="" labelStyle="sectorHighlightText" />
    <grp_eudicots fill="#FFF27B" stroke="#FFF" label="DICOTS" labelStyle="sectorHighlightTextFlip" />
    <grp_core_eudicots fill="#C6D979" stroke="#FFF" label="CORE DICOTS" labelStyle="sectorHighlightTextFlip" />
    <grp_rosids fill="#F4D2DD" stroke="#FFF" label="ROSIDS" labelStyle="sectorHighlightTextFlip" />
    <grp_fabids fill="#ECB5CA" stroke="#FFF" label="FABIDS" labelStyle="sectorHighlightTextFlip" />
    <grp_malvids fill="#E58BAF" stroke="#FFF" label="MALVIDS" labelStyle="sectorHighlightTextFlip" />
    <grp_asterid fill="#F6D7BA" stroke="#FFF" label="ASTERIDS" labelStyle="sectorHighlightText"/>
    <grp_lamiids fill="#EEB688" stroke="#FFF" label="LAMIIDS" labelStyle="sectorHighlightText" />
    <grp_campanulids fill="#E6955E" stroke="#FFF" label="CAMPANULIDS" labelStyle="sectorHighlightText" />
        
    <sectorHighlightText font-family="Verdana" font-size="9" font-weight="bold" fill="#222" rotate="90" />
    <sectorHighlightTextFlip font-family="Verdana" font-size="9" font-weight="bold" fill="#222" rotate="270" />

		
    <ncategory fill="#eeeeee" stroke="#eeeeee" type="radialGradient" >
    <stop offset="0%" style="stop-color:#eeeeee; stop-opacity:0"/>
    <stop offset="93%" style="stop-color:#eeeeee; stop-opacity:1"/>
    <stop offset="100%" style="stop-color:#dddddd; stop-opacity:1"/>
    </ncategory>	
    <bg_root fill="#444" stroke="#EEEEEE" />
    <bg_gymnosperms fill="#B0744C" stroke="#EEEEEE" />
    <bg_anita fill="#D3EEF5" stroke="#EEEEEE" />
    <bg_angiosperms fill="#D3EEF5" stroke="#EEEEEE" />
    <bg_magnoliids fill="#86C0CE" stroke="#EEEEEE" />
    <bg_monocots fill="#B0D4B7" stroke="#EEEEEE" />
    <bg_commelinids fill="#63B384" stroke="#EEEEEE" />
    <bg_eudicots fill="#FFF27B" stroke="#EEEEEE" />
    <bg_core_eudicots fill="#C6D979" stroke="#EEEEEE" />
    <bg_rosids fill="#F4D2DD" stroke="#EEEEEE" />
    <bg_fabids fill="#ECB5CA" stroke="#EEEEEE" />
    <bg_malvids fill="#E58BAF" stroke="#EEEEEE" />
    <bg_asterid fill="#F6D7BA" stroke="#EEEEEE" />
    <bg_lamiids fill="#EEB688" stroke="#EEEEEE" />
    <bg_campanulids fill="#E6955E" stroke="#EEEEEE" />
    </styles>	
    </render>
    <clade>
    XML
    root = TreeNode.find_by(name: 'root')
    root.children.each do |child|
      xml_string += get_nested_clade child
    end
    xml_string += "</clade></phylogeny></phyloxml>"
    respond_to do |format|
      format.xml {
        #send_data( xml_string, type: "text/xml", filename: "phylo.xml" )
        render xml: xml_string
      }
      format.html{
        render xml: xml_string
      }
    end
  end
  
  protected
  def get_nested_clade tree_node
    xml = "<clade><branch_length>1.0</branch_length>"
    tree_node.children.each do |child|
      xml+=get_nested_clade child
    end
    if tree_node.is_childless?
      xml += "\n<name bgStyle='bg_#{tree_node.parent.name.downcase.gsub(" ","_")}'>#{tree_node.name}</name>"
      xml += "\n<annotation>
        <desc>#{tree_node.common_name}</desc>
        <uri>#{plants_path}</uri>
      </annotation>"
      xml += "\n<chart>
        #{tree_node.ancestors[1] ? "<g1>grp_#{tree_node.ancestors[1].name.downcase.gsub(" ","_")}</g1>": '<g1>grp_none</g1>'}
        #{tree_node.ancestors[2] ? "<g2>grp_#{tree_node.ancestors[2].name.downcase.gsub(" ","_")}</g2>": '<g2>grp_none</g2>'}
        #{tree_node.ancestors[3] ? "<g3>grp_#{tree_node.ancestors[3].name.downcase.gsub(" ","_")}</g3>": '<g3>grp_none</g3>'}
        #{tree_node.ancestors[4] ? "<g4>grp_#{tree_node.ancestors[4].name.downcase.gsub(" ","_")}</g4>": '<g4>grp_none</g4>'}
        #{tree_node.ancestors[5] ? "<g5>grp_#{tree_node.ancestors[5].name.downcase.gsub(" ","_")}</g5>": '<g5>grp_none</g5>'}
        #{tree_node.ancestors[6] ? "<g6>grp_#{tree_node.ancestors[6].name.downcase.gsub(" ","_")}</g6>": '<g6>grp_none</g6>'}
        <content>#{
        if params[:measure].blank?
          Result.joins(:measure, :plant)
            .where("measures.type ='FattyAcid'")
            .where("plants.order_name='#{tree_node.name}'")
            .count
        else
          Result.joins(:measure, :plant)
  		          .where("measures.id = ?", params[:measure])
  		          .where("plants.order_name = '#{tree_node.name}'")
                .maximum(:value).to_f.try(:round,3)
        end}</content>        
      </chart>"
    end
    xml += "\n</clade>"
  end
end