# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# User.create!(email: 'admin@glbrc.org', password: 'secret', password_confirmation: 'secret')

Page.create!(title: 'home', description: 'Root homepage from icon link', content: <<-HTML
<h1><i><u>NEW</u>:</i> Nov 2017 - More than 2000 datasets from Chinese literature added</h1>
<p>PlantFAdb (previously PhyloFAdb) is under development. It provides updates and enhancements to the Seed Oil Fatty Acid (SOFA) database at the Max Rubner-Institute.</p>
<p>
  <span style="font-size: 14px; margin-left: 2em;">Matthäus, B. (2012), The new database Seed Oil Fatty Acids (SOFA). Lipid Technology, 24: 230–234.</span>
  <span style="font-size: 14px;">
  </span>
</p>
<span style="margin-left:2em">Aitzetmüller, K., Matthäus, B. and Friedrich, H. (2003), A new database for seed oil fatty acids — the database SOFA. Eur. J. Lipid Sci. Technol., 105: 92–103.</span>

<h3>Features&nbsp;<span style="color: inherit; font-family: inherit;">&nbsp;</span>
  <br>
</h3>
<p class="MsoNormal" style="margin-left: 25px;">
  <b style="mso-bidi-font-weight:normal">
    <span style="font-size:14.0pt;mso-bidi-font-size:12.0pt">Phylogenetic Trees&nbsp;</span>
  </b>
</p>
<p class="MsoNormal" style="margin-left: 25px;">&nbsp;&nbsp;&nbsp;&nbsp;The <u>initial</u> <b>Tree </b>page <a href="http://phylofadb.bch.msu.edu/tree">http://plantfadb.bch.msu.edu/tree</a>&nbsp;presents the number of FA composition datapoints that are associated with ALL publications in PlantFAdb. &nbsp;Click on a node to move to Family, <i>Genus</i> and <i>species</i>.&nbsp;</p>
<p class="MsoNormal" style="margin-left: 25px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The <b>
  <u>occurrence</u> of a fatty acid structure in different plant
  species</b>&nbsp;is displayed on a phylogenetic tree. &nbsp;The abundance (e.g. wt %) is indicated on the
  axis.&nbsp;<span style="line-height: 1.42857;">&nbsp;</span>
</p>
<p class="MsoNormal" style="margin-left: 25px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="line-height: 1.42857;">
  <b>Example:</b> </span>
  <span style="line-height: 1.42857;">&nbsp;</span>
  <span style="line-height: 1.42857;">
  </span>
  <b>
    <a href="http://phylofadb.bch.msu.edu/tree?measure_id=10274" target="_blank" style="line-height: 1.42857; background-color: rgb(255, 255, 255);">Ricinoleic</a>
    <span style="line-height: 1.42857;">:</span>
  </b>
  <span style="line-height: 1.42857;">&nbsp;
  </span>
  <span style="line-height: 1.42857;">http://plantfadb.bch.msu.edu/tree?measure_id=10274</span>
</p>
<p class="MsoNormal" style="margin-left: 25px;">
  <b style="mso-bidi-font-weight:normal">
    <span style="font-size:14.0pt;mso-bidi-font-size:12.0pt">Compiled analytical data&nbsp;</span>
  </b>
  <span style="line-height: 1.42857;">&nbsp;&nbsp;&nbsp;<b>&nbsp;Example:</b>
  </span>
  <b>
  </b>
  <span style="line-height: 1.42857;">&nbsp;</span>
  <a href="http://phylofadb.bch.msu.edu/plants/10019" target="_blank" style="line-height: 1.42857; background-color: rgb(255, 255, 255);">
    <i>
      <b>Sesamum indicum</b>
    </i>
  </a>
  <span style="line-height: 1.42857;">
    <i>
      <b>:</b>
    </i> http://plantfadb.bch.msu.edu/plants/10019</span>
  </p>
  <p class="MsoNormal" style="margin-left: 25px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Fatty acid compositions and other acyl lipid parameters for each plant
    species have been compiled from multiple publications on a single page in
    graphical form.<span style="mso-spacerun:yes">&nbsp;</span>
  </p>

  <p style="margin-left: 25px;">
  </p>

  <h4 style="font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(0, 0, 0);">Contributors to PlantFAdb</h4>
  <h5 style="font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(0, 0, 0); margin-left: 25px;">John Ohlrogge, Nick Thrower, Curtis Wilkerson,&nbsp;<span style="line-height: 1.1;">Melissa Baxter,&nbsp;</span>&nbsp;<span style="color: inherit; font-family: inherit; line-height: 1.1;">Weili Yang,&nbsp;</span>&nbsp;<span style="color: inherit; font-family: inherit; line-height: 1.1;">Kate McGlew,&nbsp;</span>&nbsp;<span style="color: inherit; font-family: inherit; line-height: 1.1;">Jinjie Liu, &nbsp;Devin Higgins, &nbsp;at&nbsp;</span>&nbsp;<i style="color: inherit; font-family: inherit; line-height: 1.1;">Michigan State University, USA</i>
  </h5>
  <h5 style="font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(0, 0, 0); margin-left: 25px;">
  </h5>
  <h5 style="font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(0, 0, 0); margin-left: 25px;">
    <span style="line-height: 1.42857;">
    </span>
  </h5>
  <h5 style="font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(0, 0, 0); margin-left: 25px;">
    <span style="line-height: 20px;">Bertrand Matthaus at&nbsp;<i>Max Rubner-Institut, Detmold, Germany</i>
    </span>
  </h5>
  <h5 style="font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(0, 0, 0); margin-left: 25px;">
    <span style="line-height: 1.42857;">
    </span>
  </h5>
  <h5 style="font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(0, 0, 0); margin-left: 25px;">
    <span style="line-height: 1.42857;">Meng Zhang,&nbsp;</span>Xiaojun Cheng and Changsheng Li&nbsp;<span style="line-height: 1.42857;">&nbsp;at&nbsp;</span>&nbsp;<i>&nbsp;<span style="line-height: 1.42857;">Northwest A&amp;F University,</span>&nbsp;<span style="line-height: 1.42857;">&nbsp;Shaanxi, China</span>&nbsp;<span style="line-height: 1.42857;">&nbsp;</span>
    </i>
  </h5>
  <h5 style="font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(0, 0, 0); margin-left: 25px;">
    <span style="line-height: 1.42857;">Vandana Mhaske,&nbsp;<i>Independent Biotechnology Professional, Pune, India</i>
    </span>
  </h5>
  <h5 style="font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(0, 0, 0); margin-left: 25px;">
    <span style="line-height: 1.42857;">Ajay W Tumaney at&nbsp;</span>&nbsp;<i>CSIR-Central Food Technological Research Institute,&nbsp;</i>&nbsp;<span style="line-height: 1.42857;">
      <i>Mysore, India</i>&nbsp;&nbsp;</span>
    </h5>
    <h5 style="font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(0, 0, 0); margin-left: 25px;">
      <br>
    </h5>
    <h5 style="font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(0, 0, 0); margin-left: 25px;">
      <br>
    </h5>
  </p>
HTML
)



Page.create!(title: 'resources', description: 'Resources link on top navbar', content: <<-HTML

<h2>Resources, Downloads and Links <i>(in progress)</i></h2>
<h4 style="margin-bottom:7.5pt;line-height:150%">
  <p>
    <b>
      <a href="https://phylofadb.bch.msu.edu/pages/Why_study">
        Why study unusual fattyacids?
      </a>
    </b>
  </p>
  <p>
    <b>
      <a href="http://phylofadb.bch.msu.edu/pages/Whats_Missing">
        Where can new FA structures be discovered? Plant Orders missing in PlantFAdb.
      </a>
    </b>
  </p>
  <p>
    <b>
      <a href="http://phylofadb.bch.msu.edu/pages/key_literature">
        Key literature and reviews on plant fatty acids with links to full text
      </a>
      <i>(if available)</i>
    </b>
  </p>
  <p>
    <b>
      <a href="https://phylofadb.bch.msu.edu/pages/Origin_Names">
        How did fatty acids get their common names?
      </a>
    </b>
  </p>
  <p>
    <b>
      <a href="http://lipidlibrary.aocs.org/History/content.cfm?ItemNumber=40993">
        Trivial/common
        names of &gt;400 fatty acids with their shorthand notation and systematic names
      </a>
    </b>
    <br>
  </p>
  <p>
    Biosynthesis of Unusual Fatty Acids: &nbsp;What is Known and What is Unknown? (in progress)
  </p>
  <p>
    <b>
      <a href="http://www2.biologie.fu-berlin.de/sysbot/poster/poster1.pdf">Beautiful angiosperm phylogeny poster (2016)&nbsp;</a>
    </b>
    <br>
  </p>
  <p>
    Literature in bibliographic software formats: Endnote,
    RIS, Tab-Delimited
  </p>
</h4>

    
HTML
)



Page.create!(title: 'help', description: 'Help page docs on user dropdown', content: <<-HTML
<p>
</p>
<h1>Help</h1>
<p>Please see <b>
<u>
<a href="https://phylofadb.bch.msu.edu/tutorial.pdf" target="_blank">Tutorial Slide Show</a>
</u>
</b>
</p>
<p>
<b>
<u>
<br>
</u>
</b>
</p>
<p>
</p>
<h5 style="color: rgb(0, 0, 0);">
<a href="http://phylofadb.bch.msu.edu/pages/help#notation_def">Definition</a>&nbsp;of Delta shorthand nomenclature</h5>
<h3 style="color: rgb(0, 0, 0);">
<font face="Calibri">Search: &nbsp;</font>
<span style="font-size: 14px; line-height: 1.42857;">Searching is currently based on case insensitive exact matching to any part of text.</span>
</h3>
<h4 style="margin-left: 25px;">Search Fatty Acids: </h4>
<p style="margin-left: 25px;">&nbsp;The Systematic names provided on the main fatty page are based on the system used at Chemical Abstracts Service. &nbsp;In most cases a IUPAC systematic name can also be found on the pages for individual fatty acids.</p>
<p style="margin-left: 25px;">&nbsp;To select a list of hydroxy fatty acids search with term 'hydroxy'. &nbsp;<span style="line-height: 1.42857;">To select a list of cyclo fatty acids search with term 'cyc'. &nbsp;Other general terms are:&nbsp;</span>
<span style="line-height: 1.42857;">epoxy, yne, octadece, C24, etc.&nbsp;</span>
</p>
<p style="margin-left: 25px;">
<span style="font-family: Calibri; color: inherit; font-size: 21px;">Search Plants</span>
<br>
</p>
<h3 style="margin-left: 25px;">
</h3>
<h5 style="margin-left: 25px;">
<span style="font-family: Calibri; line-height: 1.1;">The names presented on the main Plants page are based on Tropicos (</span>
<a href="http://www.tropicos.org/" style="font-family: inherit; line-height: 1.1; background-color: rgb(255, 255, 255);">http://www.tropicos.org/</a>). However, clicking on a plant name will bring up a page with the name from SOFA and from TNRS, and these names are also searched from the main Plants page.</h5>
<h3 style="margin-left: 25px;">
<span style="font-family:Calibri;mso-ascii-theme-font:major-latin;
mso-hansi-theme-font:major-latin">Search Literature </span>
</h3>
<h5 style="margin-left: 25px;">All fields indicated by headings are searched. &nbsp;Abstracts can be searched via Advanced search.&nbsp;<span style="line-height: 1.42857;">Diacritical marks such as German umlaut (ü, ä, ö) are not recorded consistently in the literature and should be searched with more than one spelling (e.g. Ölsäure = Oelsaeure or Olsaure; Aitzetmüller = Aitzetmueller or Aitzetmuller).</span>
</h5>

<h3>
<span style="font-family:Calibri;mso-ascii-theme-font:major-latin;
mso-hansi-theme-font:major-latin">Literature Database Identifiers&nbsp;</span>
</h3>
<h5>
<span style="font-family:Calibri;mso-ascii-theme-font:major-latin;
mso-hansi-theme-font:major-latin">Information on literature at SOFA did not include titles, abstracts, etc. &nbsp;To gather this information a number of databases were searched, beginning with WOS (Web of Science). Whenever possible we attempted to find a DOI because in most cases the DOI provides a link to the full text of the publication. &nbsp;The DOI is presented in a separate column and is a hyperlink. &nbsp;The other identifiers are entered in the column "UID".</span>
</h5>
<p class="MsoNormal">

<!--EndFragment-->
</p>
<table class="MsoTableGrid" border="1" cellspacing="0" cellpadding="0" style="border-collapse:collapse;border:none;mso-border-alt:solid windowtext .5pt;
 mso-yfti-tbllook:1184;mso-padding-alt:0in 5.4pt 0in 5.4pt">
 <tbody>
<tr style="mso-yfti-irow:0;mso-yfti-firstrow:yes">
  <td width="148" valign="top" style="width:2.05in;border:solid windowtext 1.0pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt">
  <p class="MsoNormal">
<b style="mso-bidi-font-weight:normal">
<span style="font-family:Calibri;mso-ascii-theme-font:major-latin;mso-hansi-theme-font:
  major-latin">Database Abbreviation<o:p>
</o:p>
</span>
</b>
</p>
  </td>
  <td width="213" valign="top" style="width:213.3pt;border:solid windowtext 1.0pt;
  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
  solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt">
  <p class="MsoNormal">
<span style="font-family:Calibri;mso-ascii-theme-font:
  major-latin;mso-hansi-theme-font:major-latin">
<o:p>&nbsp;</o:p>
</span>
</p>
  </td>
  <td width="82" valign="top" style="width:81.9pt;border:solid windowtext 1.0pt;
  border-left:none;mso-border-left-alt:solid windowtext .5pt;mso-border-alt:
  solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt">
  <p class="MsoNormal">
<span style="font-family:Calibri;mso-ascii-theme-font:
  major-latin;mso-hansi-theme-font:major-latin">
<o:p>&nbsp;</o:p>
</span>
</p>
  </td>
 </tr>
 <tr style="mso-yfti-irow:1">
  <td width="148" valign="top" style="width:2.05in;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0in 5.4pt 0in 5.4pt">
  <p class="MsoNormal">
<span style="font-family:Calibri;mso-ascii-theme-font:
  major-latin;mso-hansi-theme-font:major-latin">DOI: <o:p>
</o:p>
</span>
</p>
  </td>
  <td width="213" valign="top" style="width:213.3pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt">
  <p class="MsoNormal">
<span style="font-family:Calibri;mso-ascii-theme-font:
  major-latin;mso-hansi-theme-font:major-latin">Digital Object Identifier<o:p>
</o:p>
</span>
</p>
  </td>
  <td width="82" valign="top" style="width:81.9pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt">
  <p class="MsoNormal">
<span style="font-family:Calibri;mso-ascii-theme-font:
  major-latin;mso-hansi-theme-font:major-latin">
<o:p>&nbsp;</o:p>
</span>
</p>
  </td>
 </tr>
 <tr style="mso-yfti-irow:2">
  <td width="148" valign="top" style="width:2.05in;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0in 5.4pt 0in 5.4pt">
  <p class="MsoNormal">
<span style="font-family:Calibri;mso-ascii-theme-font:
  major-latin;mso-hansi-theme-font:major-latin">WOS:<o:p>
</o:p>
</span>
</p>
  </td>
  <td width="213" valign="top" style="width:213.3pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt">
  <p class="MsoNormal">
<span style="font-family:Calibri;mso-ascii-theme-font:
  major-latin;mso-hansi-theme-font:major-latin">Web of Science (Thomson
  Reuters)<o:p>
</o:p>
</span>
</p>
  </td>
  <td width="82" valign="top" style="width:81.9pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt">
  <p class="MsoNormal">
<span style="font-family:Calibri;mso-ascii-theme-font:
  major-latin;mso-hansi-theme-font:major-latin">
<o:p>&nbsp;</o:p>
</span>
</p>
  </td>
 </tr>
 <tr style="mso-yfti-irow:3">
  <td width="148" valign="top" style="width:2.05in;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0in 5.4pt 0in 5.4pt">
  <p class="MsoNormal">
<span style="font-family:Calibri;mso-ascii-theme-font:
  major-latin;mso-hansi-theme-font:major-latin">CABI: <o:p>
</o:p>
</span>
</p>
  <p class="MsoNormal">
<span style="font-family:Calibri;mso-ascii-theme-font:
  major-latin;mso-hansi-theme-font:major-latin">
<o:p>&nbsp;</o:p>
</span>
</p>
  </td>
  <td width="213" valign="top" style="width:213.3pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt">
  <p class="MsoNormal">
<span style="font-family:Calibri;mso-ascii-theme-font:
  major-latin;mso-hansi-theme-font:major-latin">Centre for Agriculture and
  Bioscience International<o:p>
</o:p>
</span>
</p>
  </td>
  <td width="82" valign="top" style="width:81.9pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt">
  <p class="MsoNormal">
<span style="font-family:Calibri;mso-ascii-theme-font:
  major-latin;mso-hansi-theme-font:major-latin">
<o:p>&nbsp;</o:p>
</span>
</p>
  </td>
 </tr>
 <tr style="mso-yfti-irow:4">
  <td width="148" valign="top" style="width:2.05in;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0in 5.4pt 0in 5.4pt">
  <p class="MsoNormal">
<span style="font-family:Calibri;mso-ascii-theme-font:
  major-latin;mso-hansi-theme-font:major-latin">BCI: <o:p>
</o:p>
</span>
</p>
  </td>
  <td width="213" valign="top" style="width:213.3pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt">
  <p class="MsoNormal">
<span style="font-family:Calibri;mso-ascii-theme-font:
  major-latin;mso-hansi-theme-font:major-latin;mso-bidi-font-weight:bold">BIOSIS
  Citation Index </span>
<span style="font-family:Calibri;mso-ascii-theme-font:
  major-latin;mso-hansi-theme-font:major-latin">(Thomson Reuters)<o:p>
</o:p>
</span>
</p>
  </td>
  <td width="82" valign="top" style="width:81.9pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt">
  <p class="MsoNormal">
<span style="font-family:Calibri;mso-ascii-theme-font:
  major-latin;mso-hansi-theme-font:major-latin">
<o:p>&nbsp;</o:p>
</span>
</p>
  </td>
 </tr>
 <tr style="mso-yfti-irow:5">
  <td width="148" valign="top" style="width:2.05in;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0in 5.4pt 0in 5.4pt">
  <p class="MsoNormal">
<span style="font-family:Calibri;mso-ascii-theme-font:
  major-latin;mso-hansi-theme-font:major-latin">FSTA: <o:p>
</o:p>
</span>
</p>
  </td>
  <td width="213" valign="top" style="width:213.3pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt">
  <p class="MsoNormal">
<span style="font-family:Calibri;mso-ascii-theme-font:
  major-latin;mso-hansi-theme-font:major-latin">Food Science and Technology
  Abstracts<o:p>
</o:p>
</span>
</p>
  </td>
  <td width="82" valign="top" style="width:81.9pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt">
  <p class="MsoNormal">
<span style="font-family:Calibri;mso-ascii-theme-font:
  major-latin;mso-hansi-theme-font:major-latin">
<o:p>&nbsp;</o:p>
</span>
</p>
  </td>
 </tr>
 <tr style="mso-yfti-irow:6">
  <td width="148" valign="top" style="width:2.05in;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0in 5.4pt 0in 5.4pt">
  <p class="MsoNormal">
<span style="font-family:Calibri;mso-ascii-theme-font:
  major-latin;mso-hansi-theme-font:major-latin">CFTRI: <o:p>
</o:p>
</span>
</p>
  </td>
  <td width="213" valign="top" style="width:213.3pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt">
  <p class="MsoNormal">
<i>
<span style="font-family:Calibri;mso-ascii-theme-font:
  major-latin;mso-hansi-theme-font:major-latin">Central Food Technological
  Research Institute (Mysore, India)</span>
</i>
<span style="font-family:Calibri;
  mso-ascii-theme-font:major-latin;mso-hansi-theme-font:major-latin">
<o:p>
</o:p>
</span>
</p>
  </td>
  <td width="82" valign="top" style="width:81.9pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt">
  <p class="MsoNormal">
<span style="font-family:Calibri;mso-ascii-theme-font:
  major-latin;mso-hansi-theme-font:major-latin">
<o:p>&nbsp;</o:p>
</span>
</p>
  </td>
 </tr>
 <tr style="mso-yfti-irow:7">
  <td width="148" valign="top" style="width:2.05in;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0in 5.4pt 0in 5.4pt">
  <p class="MsoNormal">
<span style="font-family:Calibri;mso-ascii-theme-font:
  major-latin;mso-hansi-theme-font:major-latin">MEDLINE: <o:p>
</o:p>
</span>
</p>
  </td>
  <td width="213" valign="top" style="width:213.3pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt">
  <p class="MsoNormal">
<span style="font-family:Calibri;mso-ascii-theme-font:
  major-latin;mso-hansi-theme-font:major-latin">U.S. National Library of
  Medicine<o:p>
</o:p>
</span>
</p>
  </td>
  <td width="82" valign="top" style="width:81.9pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt">
  <p class="MsoNormal">
<span style="font-family:Calibri;mso-ascii-theme-font:
  major-latin;mso-hansi-theme-font:major-latin">
<o:p>&nbsp;</o:p>
</span>
</p>
  </td>
 </tr>
 <tr style="mso-yfti-irow:8">
  <td width="148" valign="top" style="width:2.05in;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0in 5.4pt 0in 5.4pt">
  <p class="MsoNormal">
<span style="font-family:Calibri;mso-ascii-theme-font:
  major-latin;mso-hansi-theme-font:major-latin">GoogleScholar: <o:p>
</o:p>
</span>
</p>
  </td>
  <td width="213" valign="top" style="width:213.3pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt">
  <p class="MsoNormal">
<span style="font-family:Calibri;mso-ascii-theme-font:
  major-latin;mso-hansi-theme-font:major-latin">Information found via Google
  Scholar search<o:p>
</o:p>
</span>
</p>
  </td>
  <td width="82" valign="top" style="width:81.9pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt">
  <p class="MsoNormal">
<span style="font-family:Calibri;mso-ascii-theme-font:
  major-latin;mso-hansi-theme-font:major-latin">
<o:p>&nbsp;</o:p>
</span>
</p>
  </td>
 </tr>
 <tr style="mso-yfti-irow:9">
  <td width="148" valign="top" style="width:2.05in;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0in 5.4pt 0in 5.4pt">
  <p class="MsoNormal">
<span style="font-family:Calibri;mso-ascii-theme-font:
  major-latin;mso-hansi-theme-font:major-latin">ISBN: <o:p>
</o:p>
</span>
</p>
  </td>
  <td width="213" valign="top" style="width:213.3pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt">
  <p class="MsoNormal">
<span style="font-family:Calibri;mso-ascii-theme-font:
  major-latin;mso-hansi-theme-font:major-latin">International Standard Book
  Number<o:p>
</o:p>
</span>
</p>
  </td>
  <td width="82" valign="top" style="width:81.9pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt">
  <p class="MsoNormal">
<span style="font-family:Calibri;mso-ascii-theme-font:
  major-latin;mso-hansi-theme-font:major-latin">
<o:p>&nbsp;</o:p>
</span>
</p>
  </td>
 </tr>
 <tr style="mso-yfti-irow:10">
  <td width="148" valign="top" style="width:2.05in;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0in 5.4pt 0in 5.4pt">
  <p class="MsoNormal">
<span style="font-family:Calibri;mso-ascii-theme-font:
  major-latin;mso-hansi-theme-font:major-latin">PFA: <o:p>
</o:p>
</span>
</p>
  <p class="MsoNormal">
<span style="font-family:Calibri;mso-ascii-theme-font:
  major-latin;mso-hansi-theme-font:major-latin">
<o:p>&nbsp;</o:p>
</span>
</p>
  </td>
  <td width="213" valign="top" style="width:213.3pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt">
  <p class="MsoNormal">
<span style="font-family:Calibri;mso-ascii-theme-font:
  major-latin;mso-hansi-theme-font:major-latin">PlantFAdb ID (assigned by
  PlantFAdb, usually indicates that a digital record or link was not found).<o:p>
</o:p>
</span>
</p>
  </td>
  <td width="82" valign="top" style="width:81.9pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt">
  <p class="MsoNormal">
<span style="font-family:Calibri;mso-ascii-theme-font:
  major-latin;mso-hansi-theme-font:major-latin">
<o:p>&nbsp;</o:p>
</span>
</p>
  </td>
 </tr>
 <tr style="mso-yfti-irow:11">
  <td width="148" valign="top" style="width:2.05in;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0in 5.4pt 0in 5.4pt">
  <p class="MsoNormal">
<span style="font-family:Calibri;mso-ascii-theme-font:
  major-latin;mso-hansi-theme-font:major-latin">Unpub…: <o:p>
</o:p>
</span>
</p>
  </td>
  <td width="213" valign="top" style="width:213.3pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt">
  <p class="MsoNormal">
<span style="font-family:Calibri;mso-ascii-theme-font:
  major-latin;mso-hansi-theme-font:major-latin">Unpublished datasets, if
  available from SOFA, includes the date and initials of individual. E.g. AK =
  Kurt Aitzetmueller<o:p>
</o:p>
</span>
</p>
  </td>
  <td width="82" valign="top" style="width:81.9pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt">
  <p class="MsoNormal">
<span style="font-family:Calibri;mso-ascii-theme-font:
  major-latin;mso-hansi-theme-font:major-latin">
<o:p>&nbsp;</o:p>
</span>
</p>
  </td>
 </tr>
 <tr style="mso-yfti-irow:12;mso-yfti-lastrow:yes">
  <td width="148" valign="top" style="width:2.05in;border:solid windowtext 1.0pt;
  border-top:none;mso-border-top-alt:solid windowtext .5pt;mso-border-alt:solid windowtext .5pt;
  padding:0in 5.4pt 0in 5.4pt">
  <p class="MsoNormal">
<span style="font-family:Calibri;mso-ascii-theme-font:
  major-latin;mso-hansi-theme-font:major-latin">
<o:p>&nbsp;</o:p>
</span>
</p>
  </td>
  <td width="213" valign="top" style="width:213.3pt;border-top:none;border-left:
  none;border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt">
  <p class="MsoNormal">
<span style="font-family:Calibri;mso-ascii-theme-font:
  major-latin;mso-hansi-theme-font:major-latin">
<o:p>&nbsp;</o:p>
</span>
</p>
  </td>
  <td width="82" valign="top" style="width:81.9pt;border-top:none;border-left:none;
  border-bottom:solid windowtext 1.0pt;border-right:solid windowtext 1.0pt;
  mso-border-top-alt:solid windowtext .5pt;mso-border-left-alt:solid windowtext .5pt;
  mso-border-alt:solid windowtext .5pt;padding:0in 5.4pt 0in 5.4pt">
  <p class="MsoNormal">
<span style="font-family:Calibri;mso-ascii-theme-font:
  major-latin;mso-hansi-theme-font:major-latin">
<o:p>&nbsp;</o:p>
</span>
</p>
  </td>
 </tr>
</tbody>
</table>

<p class="p1">
<br>
</p>
<h3 id="notation_def">Definition of “<b>Δ</b>-Notations” from:&nbsp;<b style="font-family: Calibri; font-size: 10pt; color: rgb(51, 51, 51); line-height: 1.1;">Aitzetmüller, K., Matthäus, B. and Friedrich, H. (2003) Eur. J. Lipid Sci. Technol. 105: 92</b>
</h3>
<p class="MsoNormal" align="center" style="margin-top:0in;margin-right:192.8pt;
margin-bottom:0in;margin-left:193.4pt;margin-bottom:.0001pt;text-align:center;
line-height:normal">
<span style="font-size:9.0pt;font-family:Arial;mso-fareast-font-family:
Arial">Definition of “</span>
<b style="line-height: 1.42857;">Δ</b>
<span style="font-family: Arial; font-size: 9pt;">-Notations”</span>
</p>
<p class="MsoNormal" style="margin-top:.3pt;margin-right:0in;margin-bottom:0in;
margin-left:0in;margin-bottom:.0001pt;line-height:5.0pt;mso-line-height-rule:
exactly">
<span style="font-size:5.0pt">
<o:p>&nbsp;</o:p>
</span>
</p>
<p class="MsoNormal" align="center" style="margin-top:0in;margin-right:101.8pt;
margin-bottom:0in;margin-left:102.4pt;margin-bottom:.0001pt;text-align:center;
line-height:103%">
<span style="font-size:9.0pt;line-height:103%;font-family:
Arial;mso-fareast-font-family:Arial">Each fatty acid (and each fatty acid
partial structure) is represented by a computer-readable string of characters.
– Examples:<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin-top:.8pt;margin-right:0in;margin-bottom:0in;
margin-left:0in;margin-bottom:.0001pt;line-height:10.0pt;mso-line-height-rule:
exactly">
<span style="font-size:10.0pt">
<o:p>&nbsp;</o:p>
</span>
</p>
<p class="MsoNormal" style="margin-top:0in;margin-right:122.5pt;margin-bottom:
0in;margin-left:76.6pt;margin-bottom:.0001pt;text-indent:-34.4pt;line-height:
103%">
<b>
<span style="font-size:9.0pt;line-height:103%;font-family:Arial;
mso-fareast-font-family:Arial">Numbers </span>
</b>
<span style="font-size:9.0pt;
line-height:103%;font-family:Arial;mso-fareast-font-family:Arial">before and
after a “<b>:</b>” (<i style="mso-bidi-font-style:normal">e.g., </i>18:2) =
basic fatty acid structure, in number of carbon atoms <b>: </b>number of
multiple (double or triple) bonds present. (Important, please note: the two
multiple bonds here can be either double or triple bonds!)<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin-top:.2pt;margin-right:0in;margin-bottom:0in;
margin-left:0in;margin-bottom:.0001pt;line-height:5.5pt;mso-line-height-rule:
exactly">
<span style="font-size:5.5pt">
<o:p>&nbsp;</o:p>
</span>
</p>
<p class="MsoNormal" style="margin-top:0in;margin-right:123.5pt;margin-bottom:
0in;margin-left:76.6pt;margin-bottom:.0001pt;text-indent:-34.4pt;line-height:
103%">
<b>
<span style="font-size:9.0pt;line-height:103%;font-family:Arial;
mso-fareast-font-family:Arial">Numbers </span>
</b>
<span style="font-size:9.0pt;
line-height:103%;font-family:Arial;mso-fareast-font-family:Arial">before a “<b>:</b>”:
Length of the carbon chain (number of carbon atoms in the molecule).<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin-top:.2pt;margin-right:0in;margin-bottom:0in;
margin-left:0in;margin-bottom:.0001pt;line-height:5.5pt;mso-line-height-rule:
exactly">
<span style="font-size:5.5pt">
<o:p>&nbsp;</o:p>
</span>
</p>
<p class="MsoNormal" style="margin-top:0in;margin-right:-1.0pt;margin-bottom:
0in;margin-left:42.2pt;margin-bottom:.0001pt;line-height:normal">
<b>
<span style="font-size:9.0pt;font-family:Arial;mso-fareast-font-family:Arial">Number </span>
</b>
<span style="font-size:9.0pt;font-family:Arial;mso-fareast-font-family:Arial">immediately
following the “<b>:</b>” : Number of multiple bonds in the molecule.<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin-top:.4pt;margin-right:-1.0pt;margin-bottom:
0in;margin-left:42.2pt;margin-bottom:.0001pt;line-height:normal">
<b>
<span style="font-size:9.0pt;font-family:Arial;mso-fareast-font-family:Arial">c </span>
</b>
<span style="font-size:9.0pt;font-family:Arial;mso-fareast-font-family:Arial">(<i style="mso-bidi-font-style:normal">cis</i>), <b>t </b>(<i style="mso-bidi-font-style:
normal">trans</i>), <b>a </b>(acetylene) = type of double or triple bond.<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin-top:.4pt;margin-right:-1.0pt;margin-bottom:
0in;margin-left:42.35pt;margin-bottom:.0001pt;line-height:normal">
<b style="line-height: 1.42857;">Δ</b>
<span style="font-size:9.0pt;font-family:
&quot;Times New Roman&quot;;mso-fareast-font-family:&quot;Times New Roman&quot;;letter-spacing:
.1pt">&nbsp;</span>
<span style="font-size:9.0pt;font-family:Arial;mso-fareast-font-family:
Arial">= indicates the position of the C-C multiple bond (double or triple
bond).<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin-top:.1pt;margin-right:0in;margin-bottom:0in;
margin-left:0in;margin-bottom:.0001pt;line-height:5.0pt;mso-line-height-rule:
exactly">
<span style="font-size:5.0pt">
<o:p>&nbsp;</o:p>
</span>
</p>
<p class="MsoNormal" style="margin-top:0in;margin-right:131.0pt;margin-bottom:
0in;margin-left:76.6pt;margin-bottom:.0001pt;text-indent:-34.4pt;line-height:
10.8pt;mso-line-height-rule:exactly">
<b>
<span style="font-size:9.0pt;
font-family:Arial;mso-fareast-font-family:Arial">Numbers </span>
</b>
<span style="font-size:9.0pt;font-family:Arial;mso-fareast-font-family:Arial">after a<span style="letter-spacing:.1pt">&nbsp;</span>
</span>
<b style="line-height: 20px; text-indent: 0px;">Δ</b>
<span style="font-size:9.0pt;font-family:Arial;
mso-fareast-font-family:Arial">: Position of the double or triple bond along
the carbon chain, counting the COOH-group as carbon no. 1.<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin-top:.35pt;margin-right:0in;margin-bottom:0in;
margin-left:0in;margin-bottom:.0001pt;line-height:5.5pt;mso-line-height-rule:
exactly">
<span style="font-size:5.5pt">
<o:p>&nbsp;</o:p>
</span>
</p>
<p class="MsoNormal" style="margin-top:0in;margin-right:133.7pt;margin-bottom:
0in;margin-left:76.6pt;margin-bottom:.0001pt;text-indent:-34.4pt;line-height:
103%">
<span style="font-size:9.0pt;line-height:103%;font-family:Arial;
mso-fareast-font-family:Arial">“<b>cy</b>” following “<b>:1</b>” or “<b>:2</b>”:
Indicates presence of a cyclopent<u style="text-underline:black">e</u>ne ring,
formed by the last five carbon atoms, and with the double bond in position 2’<span style="letter-spacing:-.35pt"> </span>of the cyclopentane ring. (Note: In 18:1c<span style="letter-spacing:-.65pt">y</span>, the linear portion of the carbon chain
is saturated!)<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin-top:.2pt;margin-right:0in;margin-bottom:0in;
margin-left:0in;margin-bottom:.0001pt;line-height:5.5pt;mso-line-height-rule:
exactly">
<span style="font-size:5.5pt">
<o:p>&nbsp;</o:p>
</span>
</p>
<p class="MsoNormal" style="margin-top:0in;margin-right:-1.0pt;margin-bottom:
0in;margin-left:42.2pt;margin-bottom:.0001pt;line-height:normal">
<b>
<span style="font-size:9.0pt;font-family:Arial;mso-fareast-font-family:Arial">-O- </span>
</b>
<span style="font-size:9.0pt;font-family:Arial;mso-fareast-font-family:Arial">before
the carbon chainlength numbers:<span style="letter-spacing:-.2pt"> </span>This
designates an epoxy group.<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin-top:.1pt;margin-right:0in;margin-bottom:0in;
margin-left:0in;margin-bottom:.0001pt;line-height:6.0pt;mso-line-height-rule:
exactly">
<span style="font-size:6.0pt">
<o:p>&nbsp;</o:p>
</span>
</p>
<p class="MsoNormal" style="margin-top:0in;margin-right:-1.0pt;margin-bottom:
0in;margin-left:42.2pt;margin-bottom:.0001pt;line-height:normal">
<b>
<span style="font-size:9.0pt;font-family:Arial;mso-fareast-font-family:Arial">-OH- </span>
</b>
<span style="font-size:9.0pt;font-family:Arial;mso-fareast-font-family:Arial">before
the carbon chainlength numbers:<span style="letter-spacing:-.2pt"> </span>This
designates a hydroxy group.<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin-top:.1pt;margin-right:0in;margin-bottom:0in;
margin-left:0in;margin-bottom:.0001pt;line-height:6.0pt;mso-line-height-rule:
exactly">
<span style="font-size:6.0pt">
<o:p>&nbsp;</o:p>
</span>
</p>
<p class="MsoNormal" style="margin-top:0in;margin-right:-1.0pt;margin-bottom:
0in;margin-left:42.2pt;margin-bottom:.0001pt;line-height:normal">
<b>
<span style="font-size:9.0pt;font-family:Arial;mso-fareast-font-family:Arial">-O= </span>
</b>
<span style="font-size:9.0pt;font-family:Arial;mso-fareast-font-family:Arial">before
the carbon chainlength numbers:<span style="letter-spacing:-.2pt"> </span>This
designates a keto group.<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin-top:.1pt;margin-right:0in;margin-bottom:0in;
margin-left:0in;margin-bottom:.0001pt;line-height:6.0pt;mso-line-height-rule:
exactly">
<span style="font-size:6.0pt">
<o:p>&nbsp;</o:p>
</span>
</p>
<p class="MsoNormal" style="margin-top:0in;margin-right:124.75pt;margin-bottom:
0in;margin-left:76.6pt;margin-bottom:.0001pt;text-indent:-34.4pt;line-height:
103%">
<b>
<span style="font-size:9.0pt;line-height:103%;font-family:Arial;
mso-fareast-font-family:Arial">-cpe- </span>
</b>
<span style="font-size:9.0pt;
line-height:103%;font-family:Arial;mso-fareast-font-family:Arial">before the
carbon chainlength numbers:<span style="letter-spacing:-.2pt"> </span>This
designates a cycloprop<u style="text-underline:black">e</u>ne ring. (Note:<span style="letter-spacing:-.2pt"> </span>The carbon numbers are increased by 1; <i style="mso-bidi-font-style:normal">i.e</i>., sterculic acid is<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin-top:0in;margin-right:-1.0pt;margin-bottom:
0in;margin-left:76.6pt;margin-bottom:.0001pt;line-height:normal">
<span style="font-size:9.0pt;font-family:Arial;mso-fareast-font-family:Arial">9,10-cpe-19:1.)<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin-top:.1pt;margin-right:0in;margin-bottom:0in;
margin-left:0in;margin-bottom:.0001pt;line-height:6.0pt;mso-line-height-rule:
exactly">
<span style="font-size:6.0pt">
<o:p>&nbsp;</o:p>
</span>
</p>
<p class="MsoNormal" style="margin-top:0in;margin-right:136.55pt;margin-bottom:
0in;margin-left:76.6pt;margin-bottom:.0001pt;text-indent:-34.4pt;line-height:
103%">
<b>
<span style="font-size:9.0pt;line-height:103%;font-family:Arial;
mso-fareast-font-family:Arial">-cpa- </span>
</b>
<span style="font-size:9.0pt;
line-height:103%;font-family:Arial;mso-fareast-font-family:Arial">before the
carbon chainlength numbers:<span style="letter-spacing:-.2pt"> </span>This
designates a cycloprop<u style="text-underline:black">a</u>ne ring. Other rules
as above under -cpe-.<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin-top:.8pt;margin-right:0in;margin-bottom:0in;
margin-left:0in;margin-bottom:.0001pt;line-height:10.0pt;mso-line-height-rule:
exactly">
<span style="font-size:10.0pt">
<o:p>&nbsp;</o:p>
</span>
</p>
<p class="MsoNormal" style="margin-top:0in;margin-right:-1.0pt;margin-bottom:
0in;margin-left:76.6pt;margin-bottom:.0001pt;line-height:10.4pt;mso-line-height-rule:
exactly">
<b>
<span style="font-size:9.0pt;font-family:Arial;mso-fareast-font-family:
Arial">Examples for “</span>
</b>
<b style="line-height: 20px;">Δ</b>
<b>
<span style="font-size:9.0pt;
font-family:Arial;mso-fareast-font-family:Arial">-Notations” of fatty acids,
linked with their trivial names:</span>
</b>
<span style="font-size:9.0pt;
font-family:Arial;mso-fareast-font-family:Arial">
<o:p>
</o:p>
</span>
</p>
<p class="p1">







<!--[if gte mso 9]>
<xml>
 <w:WordDocument>
  <w:View>Normal</w:View>
  <w:Zoom>0</w:Zoom>
  <w:TrackMoves>
</w:TrackMoves>
  <w:TrackFormatting>
</w:TrackFormatting>
  <w:PunctuationKerning>
</w:PunctuationKerning>
  <w:ValidateAgainstSchemas>
</w:ValidateAgainstSchemas>
  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>
  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
  <w:DoNotPromoteQF>
</w:DoNotPromoteQF>
  <w:LidThemeOther>EN-US</w:LidThemeOther>
  <w:LidThemeAsian>JA</w:LidThemeAsian>
  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>
  <w:Compatibility>
   <w:BreakWrappedTables>
</w:BreakWrappedTables>
   <w:SnapToGridInCell>
</w:SnapToGridInCell>
   <w:WrapTextWithPunct>
</w:WrapTextWithPunct>
   <w:UseAsianBreakRules>
</w:UseAsianBreakRules>
   <w:DontGrowAutofit>
</w:DontGrowAutofit>
   <w:SplitPgBreakAndParaMark>
</w:SplitPgBreakAndParaMark>
   <w:EnableOpenTypeKerning>
</w:EnableOpenTypeKerning>
   <w:DontFlipMirrorIndents>
</w:DontFlipMirrorIndents>
   <w:OverrideTableStyleHps>
</w:OverrideTableStyleHps>
  </w:Compatibility>
  <m:mathPr>
   <m:mathFont m:val="Cambria Math">
</m:mathFont>
   <m:brkBin m:val="before">
</m:brkBin>
   <m:brkBinSub m:val="&#45;-">
</m:brkBinSub>
   <m:smallFrac m:val="off">
</m:smallFrac>
   <m:dispDef>
</m:dispDef>
   <m:lMargin m:val="0">
</m:lMargin>
   <m:rMargin m:val="0">
</m:rMargin>
   <m:defJc m:val="centerGroup">
</m:defJc>
   <m:wrapIndent m:val="1440">
</m:wrapIndent>
   <m:intLim m:val="subSup">
</m:intLim>
   <m:naryLim m:val="undOvr">
</m:naryLim>
  </m:mathPr>
</w:WordDocument>
</xml>
<![endif]-->


</p>
<table class="MsoNormalTable" border="0" cellspacing="0" cellpadding="0" style="margin-left:5.35pt;border-collapse:collapse;mso-table-layout-alt:fixed;
 mso-yfti-tbllook:480;mso-padding-alt:0in 0in 0in 0in">
 <tbody>
<tr style="mso-yfti-irow:0;mso-yfti-firstrow:yes;height:46.55pt;mso-height-rule:
  exactly">
  <td width="169" valign="top" style="width:168.5pt;border:none;border-left:solid black 1.0pt;
  mso-border-left-alt:solid black .5pt;padding:0in 0in 0in 0in;height:46.55pt;
  mso-height-rule:exactly">
  <p class="MsoNormal" style="margin-top:3.2pt;margin-right:30.5pt;margin-bottom:
  0in;margin-left:70.7pt;margin-bottom:.0001pt;line-height:103%">
</p>
<p class="MsoNormal" style="margin-top:3.2pt;margin-right:30.5pt;margin-bottom:
  0in;margin-left:70.7pt;margin-bottom:.0001pt;line-height:103%">
<span style="font-family: Arial; font-size: 9pt; line-height: 103%; background-color: transparent;">Linoleic acid</span>
<br>
</p>
<p class="MsoNormal" style="margin-top:3.2pt;margin-right:30.5pt;margin-bottom:
  0in;margin-left:70.7pt;margin-bottom:.0001pt;line-height:103%">
<span style="font-size:9.0pt;line-height:103%;font-family:Arial;mso-fareast-font-family:
  Arial">
<span style="letter-spacing:-.5pt">V</span>ernolic acid
  </span>
</p>
<p class="MsoNormal" style="margin-top:3.2pt;margin-right:30.5pt;margin-bottom:
  0in;margin-left:70.7pt;margin-bottom:.0001pt;line-height:103%">
<span style="font-family: Arial; font-size: 9pt; line-height: 103%; background-color: transparent;">Agonandric acid</span>
<br>
</p>
<p class="MsoNormal" style="margin-top:3.2pt;margin-right:30.5pt;margin-bottom:
  0in;margin-left:70.7pt;margin-bottom:.0001pt;line-height:103%">
<span style="font-size:9.0pt;line-height:103%;font-family:Arial;mso-fareast-font-family:
  Arial">Stearidonic acid<o:p>
</o:p>
</span>
</p>
  </td>
  <td width="14" valign="top" style="width:.2in;padding:0in 0in 0in 0in;height:
  46.55pt;mso-height-rule:exactly">
  <p class="MsoNormal" style="margin-top:3.2pt;margin-right:-1.0pt;margin-bottom:
  0in;margin-left:4.55pt;margin-bottom:.0001pt;line-height:normal">
<span style="font-size:9.0pt;font-family:Arial;mso-fareast-font-family:Arial">=<o:p>
</o:p>
</span>
</p>
  <p class="MsoNormal" style="margin-top:.4pt;margin-right:-1.0pt;margin-bottom:
  0in;margin-left:4.55pt;margin-bottom:.0001pt;line-height:normal">
<span style="font-size:9.0pt;font-family:Arial;mso-fareast-font-family:Arial">=<o:p>
</o:p>
</span>
</p>
  <p class="MsoNormal" style="margin-top:.4pt;margin-right:-1.0pt;margin-bottom:
  0in;margin-left:4.55pt;margin-bottom:.0001pt;line-height:normal">
<span style="font-size:9.0pt;font-family:Arial;mso-fareast-font-family:Arial">=</span>
</p>
<p class="MsoNormal" style="margin-top:.4pt;margin-right:-1.0pt;margin-bottom:
  0in;margin-left:4.55pt;margin-bottom:.0001pt;line-height:normal">
<span style="font-family: Arial; font-size: 9pt; background-color: transparent;">=</span>
</p>
  </td>
  <td width="298" valign="top" style="width:298.45pt;border:none;border-right:solid black 1.0pt;
  mso-border-right-alt:solid black .5pt;padding:0in 0in 0in 0in;height:46.55pt;
  mso-height-rule:exactly">
  <p class="MsoNormal" style="margin-top:3.2pt;margin-right:-1.0pt;margin-bottom:
  0in;margin-left:4.55pt;margin-bottom:.0001pt;line-height:normal">
<span style="font-size:9.0pt;font-family:Arial;mso-fareast-font-family:Arial">18:2</span>
<span style="line-height: 20px;">Δ</span>
<span style="font-size: 9pt; font-family: Arial;">9c,12c<o:p>
</o:p>
</span>
</p>
  <p class="MsoNormal" style="margin-top:0in;margin-right:-1.0pt;margin-bottom:
  0in;margin-left:4.55pt;margin-bottom:.0001pt;line-height:10.75pt;mso-line-height-rule:
  exactly">
<span style="font-size:9.0pt;font-family:Arial;mso-fareast-font-family:
  Arial;position:relative;top:-.5pt;mso-text-raise:.5pt">12,13-O-18:1</span>
<span style="font-size:9.0pt;font-family:Arial;mso-fareast-font-family:Arial;
  position:relative;top:-.5pt;mso-text-raise:.5pt">
<span style="font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 20px;">Δ</span>9c</span>
<span style="font-size:9.0pt;font-family:Arial;mso-fareast-font-family:Arial">
<o:p>
</o:p>
</span>
</p>
  <p class="MsoNormal" style="margin-top:0in;margin-right:-1.0pt;margin-bottom:
  0in;margin-left:4.55pt;margin-bottom:.0001pt;line-height:10.75pt;mso-line-height-rule:
  exactly">
<span style="font-size:9.0pt;font-family:Arial;mso-fareast-font-family:
  Arial;position:relative;top:-.5pt;mso-text-raise:.5pt">8-OH-18:2</span>
<span style="font-size:9.0pt;font-family:Arial;mso-fareast-font-family:Arial;
  position:relative;top:-.5pt;mso-text-raise:.5pt">
<span style="font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 20px;">Δ</span>9a,<span style="letter-spacing:
  -.65pt">1</span>1t</span>
<span style="font-size:9.0pt;font-family:Arial;
  mso-fareast-font-family:Arial">
<o:p>
</o:p>
</span>
</p>
  <p class="MsoNormal" style="margin-top:0in;margin-right:-1.0pt;margin-bottom:
  0in;margin-left:4.55pt;margin-bottom:.0001pt;line-height:10.65pt;mso-line-height-rule:
  exactly">
<span style="font-size:9.0pt;font-family:Arial;mso-fareast-font-family:
  Arial;position:relative;top:-.5pt;mso-text-raise:.5pt">18:4</span>
<span style="font-size:9.0pt;font-family:Arial;mso-fareast-font-family:Arial;
  position:relative;top:-.5pt;mso-text-raise:.5pt">
<span style="font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; font-size: 14px; line-height: 20px;">Δ</span>6c,9c,12c,15c</span>
<span style="font-size:9.0pt;font-family:Arial;mso-fareast-font-family:Arial">
<o:p>
</o:p>
</span>
</p>
  </td>
 </tr>
 <tr style="mso-yfti-irow:1;mso-yfti-lastrow:yes;height:38.45pt;mso-height-rule:
  exactly">
  <td width="169" valign="top" style="width:168.5pt;border-top:none;border-left:
  solid black 1.0pt;border-bottom:solid black 1.0pt;border-right:none;
  mso-border-left-alt:solid black .5pt;mso-border-bottom-alt:solid black .5pt;
  padding:0in 0in 0in 0in;height:38.45pt;mso-height-rule:exactly">
  <p class="MsoNormal" style="margin-top:0in;margin-right:-1.0pt;margin-bottom:
  0in;margin-left:70.7pt;margin-bottom:.0001pt;line-height:10.1pt;mso-line-height-rule:
  exactly">
<span style="font-size:9.0pt;font-family:Arial;mso-fareast-font-family:
  Arial">2-Hydroxysterculic acid<o:p>
</o:p>
</span>
</p>
  <p class="MsoNormal" style="margin-top:.4pt;margin-right:-1.0pt;margin-bottom:
  0in;margin-left:70.7pt;margin-bottom:.0001pt;line-height:normal">
<span style="font-size:9.0pt;font-family:Arial;mso-fareast-font-family:Arial">Phlomic
  acid<o:p>
</o:p>
</span>
</p>
  <p class="MsoNormal" style="margin-top:.4pt;margin-right:-1.0pt;margin-bottom:
  0in;margin-left:70.7pt;margin-bottom:.0001pt;line-height:normal">
<span style="font-size:9.0pt;font-family:Arial;mso-fareast-font-family:Arial">Manoaic
  acid<o:p>
</o:p>
</span>
</p>
  </td>
  <td width="14" valign="top" style="width:.2in;border:none;border-bottom:solid black 1.0pt;
  mso-border-bottom-alt:solid black .5pt;padding:0in 0in 0in 0in;height:38.45pt;
  mso-height-rule:exactly">
  <p class="MsoNormal" style="margin-top:0in;margin-right:-1.0pt;margin-bottom:
  0in;margin-left:4.55pt;margin-bottom:.0001pt;line-height:10.1pt;mso-line-height-rule:
  exactly">
<span style="font-size:9.0pt;font-family:Arial;mso-fareast-font-family:
  Arial">=<o:p>
</o:p>
</span>
</p>
  <p class="MsoNormal" style="margin-top:.4pt;margin-right:-1.0pt;margin-bottom:
  0in;margin-left:4.55pt;margin-bottom:.0001pt;line-height:normal">
<span style="font-size:9.0pt;font-family:Arial;mso-fareast-font-family:Arial">=<o:p>
</o:p>
</span>
</p>
  <p class="MsoNormal" style="margin-top:.4pt;margin-right:-1.0pt;margin-bottom:
  0in;margin-left:4.55pt;margin-bottom:.0001pt;line-height:normal">
<span style="font-size:9.0pt;font-family:Arial;mso-fareast-font-family:Arial">=<o:p>
</o:p>
</span>
</p>
  </td>
  <td width="298" valign="top" style="width:298.45pt;border-top:none;border-left:
  none;border-bottom:solid black 1.0pt;border-right:solid black 1.0pt;
  mso-border-bottom-alt:solid black .5pt;mso-border-right-alt:solid black .5pt;
  padding:0in 0in 0in 0in;height:38.45pt;mso-height-rule:exactly">
  <p class="MsoNormal" style="margin-top:0in;margin-right:-1.0pt;margin-bottom:
  0in;margin-left:4.55pt;margin-bottom:.0001pt;line-height:10.1pt;mso-line-height-rule:
  exactly">
<span style="font-size:9.0pt;font-family:Arial;mso-fareast-font-family:
  Arial">2-OH-9,10-cpe-19:1<o:p>
</o:p>
</span>
</p>
  <p class="MsoNormal" style="margin-top:.4pt;margin-right:-1.0pt;margin-bottom:
  0in;margin-left:4.55pt;margin-bottom:.0001pt;line-height:normal">
<span style="font-size:9.0pt;font-family:Arial;mso-fareast-font-family:Arial">20:2</span>
<span style="line-height: 20px;">Δ</span>
<span style="font-size:9.0pt;font-family:
  Arial;mso-fareast-font-family:Arial">7,8allene<o:p>
</o:p>
</span>
</p>
  <p class="MsoNormal" style="margin-top:0in;margin-right:-1.0pt;margin-bottom:
  0in;margin-left:4.55pt;margin-bottom:.0001pt;line-height:10.75pt;mso-line-height-rule:
  exactly">
<span style="font-size: 9pt; font-family: Arial; position: relative; top: -0.5pt;">16:2cy</span>
<span style="line-height: 1.42857; background-color: transparent;">Δ</span>
<span style="line-height: 1.42857; background-color: transparent;">6c</span>
</p>
  </td>
 </tr>
</tbody>
</table>
<p class="p1">
<b style="font-family: Calibri; font-size: 10pt; color: rgb(51, 51, 51); line-height: 1.1;">
<br>
</b>
</p>
<p class="p1">
<br>
</p>
<p>
</p>
<p>
</p>
<p>
</p>
HTML
)




Page.create!(title: 'about', description: 'About page details on user dropdown', content: <<-HTML
<p>
</p>
<h3>About PlantFAdb &nbsp;(previously PhyloFAdb)</h3>
<p>
</p>
<h2 style="font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif; color: rgb(0, 0, 0);">
<b style="font-size: 14px; line-height: 1.42857;">OBJECTIVE: </b>
<span style="font-size: 14px; line-height: 1.42857;">&nbsp;</span>
</h2>

<!--StartFragment-->

<p class="MsoNormal" style="margin-top:7.5pt;margin-right:0in;margin-bottom:7.5pt;
margin-left:0in;mso-outline-level:5">The <b>Seed Oil Fatty Acid (SOFA) </b>database (http://sofa.mri.bund.de/) based at the Max Rubner Institute is a unique resource that presents data from &gt;1500 publications (+
unpublished data) for &gt;300 fatty acids and is based on analysis of ~7000
plant species. Building on SOFA, we are developing <b>PlantFAdb </b>as a tool
to allow users to easily explore phylogenetic relationships between fatty acid
structures and the plant species that produce them.</p>

<p class="MsoNormal">
<b>“Tree” </b>displays
the phylogenetic relationships between species that produce specific fatty
acids, or groups of fatty acids. The initial overview displays plant orders and
the wt% composition of a fatty acid reported for species within each order.
Users can navigate to the level of family, genus and species by clicking on
nodes in the phylogenetic tree. Clicking on bars in the graph leads to publications
underlying the data.</p>

<p class="MsoNormal">&nbsp;<b>“Fatty Acids”</b> page presents the structures, MW, short-hand notation,
systematic and common names for over 400 fatty acids produced by plants.&nbsp; <o:p>
</o:p>
</p>

<ul>
<li style="text-indent: -0.25in;">
<!--[if !supportLists]-->
<span style="font-family:Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:
Symbol">·<span style="font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>
</span>
<!--[endif]-->Clicking on the structure presents links to other
databases and a list of publications that report the fatty acid and plants that contain the fatty acid.<o:p>
</o:p>
</li>
</ul>

<ul>
<li style="text-indent: -0.25in;">
<!--[if !supportLists]-->
<span style="font-family:Symbol;mso-fareast-font-family:Symbol;mso-bidi-font-family:
Symbol">·<span style="font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>
</span>
<!--[endif]-->Clicking on “Tree” from the Fatty Acid page presents
a phylogenetic tree that displays the reported occurrence of the fatty acid within
the plant kingdom.</li>
</ul>

<p class="MsoNormal">
<b>“Plants” </b>provides
of list of &gt;8000 plants included in the database, oil content of
seeds (when available) and links to publications for the species.&nbsp; Clicking on a plant name leads to a graph
showing the fatty acid composition and other data compiled from multiple
publications.&nbsp; Clicking on the points in
the graph leads to publications.</p>

<p class="MsoNormal">
<b>“Literature” </b>provides
a list of more than 3000 publications with data used in PlantFAdb. Clicking
on an individual publication provides additional information including the
plant species and the number of fatty acid data points for each. In addition there are approximately 700 tables of FA composition from unpublished studies, most of which were conducted at the&nbsp;<span style="font-family: Helvetica; font-size: 9px;">Institute for Lipid Research,&nbsp;</span>
<span style="font-family: Helvetica; font-size: 9px;">Münster,&nbsp;</span>
<span style="font-family: Helvetica; font-size: 9px;">Germany.</span>
</p>
<p class="MsoNormal">
</p>
<p class="MsoNormal">
<span style="font-size: 18pt;">Additions to SOFA that have been incorporated into PlantFAdb</span>
<br>
</p>
<h3 style="font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(0, 0, 0);">

<p class="MsoNormal" style="margin-top:7.5pt;margin-right:0in;margin-bottom:7.5pt;
margin-left:0in;mso-outline-level:5">
<span style="font-size:18.0pt;mso-fareast-font-family:
&quot;Times New Roman&quot;;mso-bidi-font-family:&quot;Times New Roman&quot;">Fatty acids</span>
<span style="font-size:10.5pt;mso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:
&quot;Times New Roman&quot;">
<o:p>
</o:p>
</span>
</p>

<ul type="disc">
 <ul type="circle">
  <li class="MsoNormal" style="mso-margin-top-alt:auto;mso-margin-bottom-alt:
      auto;line-height:15.0pt;mso-list:l1 level2 lfo1;tab-stops:list 1.0in">
<span style="font-size:10.0pt;mso-fareast-font-family:&quot;Times New Roman&quot;;
      mso-bidi-font-family:&quot;Times New Roman&quot;">Updated systematic names for
      fatty acids. &nbsp;The primary systematic name used by PlantFAdb is based on the Chemical Abstract Service. &nbsp;In most cases a IUPAC systematic name is also provided on pages for individual fatty acids.&nbsp;<o:p>
</o:p>
</span>
</li>
  <li class="MsoNormal" style="mso-margin-top-alt:auto;mso-margin-bottom-alt:
      auto;line-height:15.0pt;mso-list:l1 level2 lfo1;tab-stops:list 1.0in">
<span style="font-size:10.0pt;mso-fareast-font-family:&quot;Times New Roman&quot;;
      mso-bidi-font-family:&quot;Times New Roman&quot;">Chemical structures for fatty
      acids (drawn based on systematic name by software at&nbsp;<a href="http://opsin.ch.cam.ac.uk/).">http://opsin.ch.cam.ac.uk/).</a>&nbsp;
      In cases where the double bond location or configuration or other aspects
      of name are not specified, a structure is usually still provided.<o:p>
</o:p>
</span>
</li>
  <li class="MsoNormal" style="mso-margin-top-alt:auto;mso-margin-bottom-alt:
      auto;line-height:15.0pt;mso-list:l1 level2 lfo1;tab-stops:list 1.0in">
<span style="font-size:10.0pt;mso-fareast-font-family:&quot;Times New Roman&quot;;
      mso-bidi-font-family:&quot;Times New Roman&quot;">Additional names, and common
      names added&nbsp;(in most cases based on CAS)<o:p>
</o:p>
</span>
</li>
  <li class="MsoNormal" style="mso-margin-top-alt:auto;mso-margin-bottom-alt:
      auto;line-height:15.0pt;mso-list:l1 level2 lfo1;tab-stops:list 1.0in">
<span style="font-size:10.0pt;mso-fareast-font-family:&quot;Times New Roman&quot;;
      mso-bidi-font-family:&quot;Times New Roman&quot;">Molecular weight and formula
      added for most FA<o:p>
</o:p>
</span>
</li>
  <li class="MsoNormal" style="mso-margin-top-alt:auto;mso-margin-bottom-alt:
      auto;line-height:15.0pt;mso-list:l1 level2 lfo1;tab-stops:list 1.0in">
<span style="font-size:10.0pt;mso-fareast-font-family:&quot;Times New Roman&quot;;
      mso-bidi-font-family:&quot;Times New Roman&quot;">CAS ID numbers added for
      approximately 300 fatty acids.<o:p>
</o:p>
</span>
</li>
  <li class="MsoNormal" style="mso-margin-top-alt:auto;mso-margin-bottom-alt:
      auto;line-height:15.0pt;mso-list:l1 level2 lfo1;tab-stops:list 1.0in">
<span style="font-size:10.0pt;mso-fareast-font-family:&quot;Times New Roman&quot;;
      mso-bidi-font-family:&quot;Times New Roman&quot;">Links to other chemical databases
      such as PUBCHEM, LIPIDMAPS added<o:p>
</o:p>
</span>
</li>
  <li class="MsoNormal" style="mso-margin-top-alt:auto;mso-margin-bottom-alt:
      auto;line-height:15.0pt;mso-list:l1 level2 lfo1;tab-stops:list 1.0in">
<span style="font-size:10.0pt;mso-fareast-font-family:&quot;Times New Roman&quot;;
      mso-bidi-font-family:&quot;Times New Roman&quot;">Machine readable chemical
      notations added (SMILES, InChI, etc.).<o:p>
</o:p>
</span>
</li>
  <li class="MsoNormal" style="mso-margin-top-alt:auto;mso-margin-bottom-alt:
      auto;line-height:15.0pt;mso-list:l1 level2 lfo1;tab-stops:list 1.0in">
<span style="font-size:10.0pt;mso-fareast-font-family:&quot;Times New Roman&quot;;
      mso-bidi-font-family:&quot;Times New Roman&quot;">Global search for all data.<o:p>
</o:p>
</span>
</li>
 </ul>
</ul>

<p class="MsoNormal" style="margin-top:0in;margin-right:0in;margin-bottom:7.5pt;
margin-left:.5in;mso-line-height-alt:15.0pt">
<span style="font-size:18.0pt;
mso-bidi-font-family:&quot;Times New Roman&quot;">Plants</span>
<span style="font-size:
10.0pt;mso-bidi-font-family:&quot;Times New Roman&quot;">&nbsp;<o:p>
</o:p>
</span>
</p>

<ul type="disc">
 <ul type="circle">
  <li class="MsoNormal" style="mso-margin-top-alt:auto;mso-margin-bottom-alt:
      auto;line-height:15.0pt;mso-list:l1 level2 lfo1;tab-stops:list 1.0in">
<span style="font-size:10.0pt;mso-fareast-font-family:&quot;Times New Roman&quot;;
      mso-bidi-font-family:&quot;Times New Roman&quot;">Approximately 30% of plant names
      in SOFA were updated (mainly Family names) based on information at the
      Taxonomic Name Resolution Service (http://tnrs.iplantcollaborative.org/).<o:p>
</o:p>
</span>
</li>
  <li class="MsoNormal" style="mso-margin-top-alt:auto;mso-margin-bottom-alt:
      auto;line-height:15.0pt;mso-list:l1 level2 lfo1;tab-stops:list 1.0in">
<span style="font-size:10.0pt;mso-fareast-font-family:&quot;Times New Roman&quot;;
      mso-bidi-font-family:&quot;Times New Roman&quot;">Common names of plants (English)
      based on USDA (</span>
<b>
<span style="font-size:10.0pt;mso-fareast-font-family:
      &quot;Times New Roman&quot;;mso-bidi-font-family:Arial;color:#006621">plants</span>
</b>
<span style="font-size:10.0pt;mso-fareast-font-family:&quot;Times New Roman&quot;;
      mso-bidi-font-family:Arial;color:#006621">.</span>
<b>
<span style="font-size:10.0pt;
      mso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:Arial;
      color:#006621">usda</span>
</b>
<span style="font-size:10.0pt;mso-fareast-font-family:&quot;Times New Roman&quot;;
      mso-bidi-font-family:Arial;color:#006621">.gov/) have been added for approximately
      3000 species (in progress).</span>
<span style="font-size:10.0pt;
      mso-fareast-font-family:&quot;Times New Roman&quot;;mso-bidi-font-family:&quot;Times New Roman&quot;">
<o:p>
</o:p>
</span>
</li>
 </ul>
</ul>

<p class="MsoNormal" style="margin-top:15.0pt;margin-right:0in;margin-bottom:
7.5pt;margin-left:.5in;mso-outline-level:3">
<span style="font-size: 16pt;">&nbsp;&nbsp;&nbsp;&nbsp;Literature<o:p>
</o:p>
</span>
</p>

<ul type="disc">
 <ul type="circle">
  <li class="MsoNormal" style="mso-margin-top-alt:auto;mso-margin-bottom-alt:
      auto;line-height:15.0pt;mso-list:l1 level2 lfo1;tab-stops:list 1.0in">
<span style="font-size:10.0pt;mso-fareast-font-family:&quot;Times New Roman&quot;;
      mso-bidi-font-family:&quot;Times New Roman&quot;">Titles added for more than 1700 references<o:p>
</o:p>
</span>
</li>
  <li class="MsoNormal" style="mso-margin-top-alt:auto;mso-margin-bottom-alt:
      auto;line-height:15.0pt;mso-list:l1 level2 lfo1;tab-stops:list 1.0in">
<span style="font-size:10.0pt;mso-fareast-font-family:&quot;Times New Roman&quot;;
      mso-bidi-font-family:&quot;Times New Roman&quot;">Abstracts added for more than 1100 references<o:p>
</o:p>
</span>
</li>
  <li class="MsoNormal" style="mso-margin-top-alt:auto;mso-margin-bottom-alt:
      auto;line-height:15.0pt;mso-list:l1 level2 lfo1;tab-stops:list 1.0in">
<span style="font-size:10.0pt;mso-fareast-font-family:&quot;Times New Roman&quot;;
      mso-bidi-font-family:&quot;Times New Roman&quot;">Digital Object Identifier (DOI)
      added for approximately 900 references. &nbsp;In most cases this provides
      a link to the full text of the publication.</span>
</li>
<li class="MsoNormal" style="mso-margin-top-alt:auto;mso-margin-bottom-alt:
      auto;line-height:15.0pt;mso-list:l1 level2 lfo1;tab-stops:list 1.0in">
<span style="font-size:10.0pt;mso-fareast-font-family:&quot;Times New Roman&quot;;
      mso-bidi-font-family:&quot;Times New Roman&quot;">Update of literature with ~150 publications from past 10 years (in progress)</span>
</li>
<li class="MsoNormal" style="mso-margin-top-alt:auto;mso-margin-bottom-alt:
      auto;line-height:15.0pt;mso-list:l1 level2 lfo1;tab-stops:list 1.0in">
<span style="font-size:10.0pt;mso-fareast-font-family:&quot;Times New Roman&quot;;
      mso-bidi-font-family:&quot;Times New Roman&quot;">
<br>
</span>
</li>
<li class="MsoNormal" style="mso-margin-top-alt:auto;mso-margin-bottom-alt:
      auto;line-height:15.0pt;mso-list:l1 level2 lfo1;tab-stops:list 1.0in">Survey of Chinese Literature (in
progress)
<span style="font-size: 10pt;">&nbsp;</span>
<br>
</li>
</ul>
</ul>

<p class="MsoNormal" style="margin-left: 0.5in; text-indent: 0in; line-height: 15pt; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;">
<!--[if !supportLists]-->
<span style="font-size: 10pt; font-family: Symbol;">·<span style="font-stretch: normal; font-size: 7pt; line-height: normal; font-family: &quot;Times New Roman&quot;;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span>
</span>
<!--[endif]-->
<span style="font-size: 10.5pt;">Data from
~900 publications and 6 books including 1344 species from 125 families with 4300
fatty acid profiles</span>
</p>
<p class="MsoNormal" style="margin-left: 0.5in; text-indent: 0in; line-height: 15pt; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;">
<b style="font-size: 14px;">Note:&nbsp;</b>
<span style="font-size: 14px;">PlantFAdb does not include data from SOFA for tocopherols, sterols, and triacylglycerol structures. &nbsp;In addition, some remarks provided by SOFA in FA analysis tables are not yet incorporated and some FA data is not yet incorporated mostly because the units reported for the analysis are uncertain. &nbsp;Links to original SOFA website tables are provided when available. &nbsp;It is likely that some mistakes have been made during incorporation of SOFA information into PlantFAdb. Please notify John Ohlrogge if you find these.&nbsp;</span>
<br>
</p>
</h3>
<h4 style="font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(0, 0, 0);">
<p class="MsoNormal" style="font-size: 14px;">
<b>
<o:p>
</o:p>
</b>
</p>
</h4>
<h3 style="font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(0, 0, 0);">
</h3>
<h4 style="font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(0, 0, 0);">
<b>Contributors to PlantFAdb</b>
</h4>
<h5 style="font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(0, 0, 0); margin-left: 25px;">John Ohlrogge, Nick Thrower, Curtis Wilkerson,&nbsp;<span style="line-height: 1.1;">Melissa Baxter,&nbsp;</span>&nbsp;<span style="color: inherit; font-family: inherit; line-height: 1.1;">Weili Yang,&nbsp;</span>&nbsp;<span style="color: inherit; font-family: inherit; line-height: 1.1;">Kate McGlew,&nbsp;</span>&nbsp;<span style="color: inherit; font-family: inherit; line-height: 1.1;">Jinjie Liu, &nbsp;Devin Higgins, &nbsp;at&nbsp;</span>&nbsp;<i style="color: inherit; font-family: inherit; line-height: 1.1;">Michigan State University, USA</i></h5><h5 style="font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(0, 0, 0); margin-left: 25px;"></h5><h5 style="font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(0, 0, 0); margin-left: 25px;"><span style="line-height: 1.42857;"></span></h5><h5 style="font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(0, 0, 0); margin-left: 25px;"><span style="line-height: 20px;">Bertrand Matthaus at&nbsp;<i>Max Rubner-Institut, Detmold, Germany</i></span></h5><h5 style="font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(0, 0, 0); margin-left: 25px;"><span style="line-height: 1.42857;"></span></h5><h5 style="font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(0, 0, 0); margin-left: 25px;"><span style="line-height: 1.42857;">Meng Zhang,&nbsp;</span>Xiaojun Cheng and Changsheng Li&nbsp;<span style="line-height: 1.42857;">&nbsp;at&nbsp;</span>&nbsp;<i>&nbsp;<span style="line-height: 1.42857;">Northwest A&amp;F University,</span>&nbsp;<span style="line-height: 1.42857;">&nbsp;Shaanxi, China</span>&nbsp;<span style="line-height: 1.42857;">&nbsp;</span></i></h5><h5 style="font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(0, 0, 0); margin-left: 25px;"><span style="line-height: 1.42857;">Vandana Mhaske,&nbsp;<i>Independent Biotechnology Professional, Pune, India</i></span></h5><h5 style="font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; color: rgb(0, 0, 0); margin-left: 25px;"><span style="line-height: 1.42857;">Ajay W Tumaney at&nbsp;</span>&nbsp;<i>CSIR-Central Food Technological Research Institute,&nbsp;</i>&nbsp;<span style="line-height: 1.42857;">&nbsp;<i>Mysore, India</i>&nbsp;&nbsp;</span></h5>
<hr>
<p>
</p>
<style type="text/css">
p.p1 {margin: 0.0px 0.0px 0.0px 0.0px; font: 9.0px Helvetica}
</style>
HTML
)



Page.create!(title: 'contact', description: 'Contact information on user dropdown', content: <<-HTML

<p><p>
</p><h1>Contact</h1>Please provide comments, suggestions, error reports, etc. to:</p><p>John Ohlrogge<p></p>
<p>Department of Plant Biology</p>
<p>Michigan State University</p>
<p>East Lansing, MI 48824 &nbsp;USA</p>
<p>ohlrogge'at'msu.edu<br>
</p><hr>
<p></p></p>


HTML
)




Page.create!(title: 'key_literature', description: 'list of ~70 pubs and a few reviews', content: <<-HTML

<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify;">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">
<o:p>&nbsp;DOI (digital object identifier) shown in bold will provide link to full text in most cases.&nbsp;</o:p>
</span>
</b>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 0.2in; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<b>
</b>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 0.2in; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<b>
<span style="font-size: 12pt; font-family: Helvetica;">
<br>
</span>
</b>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 0.2in; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<b>
<span style="font-size: 12pt; font-family: Helvetica;">A few reviews<o:p>
</o:p>
</span>
</b>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">
<o:p>&nbsp;</o:p>
</span>
</b>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span class="SpellE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Badami</span>
</b>
</span>
<b>
<span style="font-size: 11pt; font-family: Helvetica;">, R.C., and&nbsp;<span class="SpellE">Patil</span>, K.B.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1981).&nbsp;<span class="GramE">Structure and Occurrence of Unusual Fatty Acids in Minor Seed Oils.</span>&nbsp;<span class="GramE">Progress in Lipid Research&nbsp;<b>19,</b>119-153.</span>&nbsp;&nbsp;&nbsp;&nbsp;<b>10.1016/0163-7827(<span class="GramE">80)90002</span>-8</b>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Christensen, L.P., and Brandt, K.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(2006). Acetylenes and&nbsp;<span class="SpellE">Psoralens</span><b>, in&nbsp;</b>Plant Secondary Metabolites: Occurrence, Structure and Role in the Human Diet<b>&nbsp;</b>137-173.&nbsp;&nbsp;&nbsp;&nbsp;<b>10.1002/9780470988558.ch5</b>&nbsp;&nbsp;<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span class="SpellE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Dembitsky</span>
</b>
</span>
<b>
<span style="font-size: 11pt; font-family: Helvetica;">, V.M., and&nbsp;<span class="SpellE">Srebnik</span>, M.&nbsp;</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">(2002).<b>&nbsp;</b>Natural Halogenated Fatty Acids: Their Analogues and Derivatives.&nbsp;<span class="GramE">Progress in Lipid Research 41, 315-367.</span>
<b>&nbsp;&nbsp;&nbsp;&nbsp;10.1016/s0163-<span class="GramE">7827(</span>02)00003-6</b></span></p><p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">


<style type="text/css">
p.p1 {margin: 0.0px 0.0px 0.0px 0.0px; line-height: 16.0px; font: 14.0px Arial; -webkit-text-stroke: #000000}
span.s1 {font-kerning: none}
</style>

</p><p class="p1">&nbsp;&nbsp;&nbsp;<span class="s1"><b>Gunstone, F.D., Harwood, J.L, Dkjkstra, A.J</b>. (2007) The Lipid Handbook with CD-ROM, Third Edition.&nbsp;</span><span style="-webkit-text-stroke-width: initial;"><b>ISBN-10: 0849396883 &nbsp;</b><i><u>(This book and the CD-ROM are highly recommended and provide a superb database for over 12,000 lipid structures, including &gt;1000 fatty acids)</u></i>.&nbsp;</span></p>


<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;"><span style="font-size: 11pt; font-family: Helvetica;"><b><o:p>
</o:p>
</b>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; line-height: normal; text-align: justify; text-indent: -0.2in;">
<b style="font-family: &quot;Times New Roman&quot;; font-size: 10pt;">
<span style="font-size: 11pt; font-family: Helvetica;">Hildebrand, D.&nbsp;</span>
</b>
<span style="font-family: Helvetica; font-size: 11pt;">(2010) Production of Unusual Fatty Acids in Plants</span>
<font face="Times New Roman">
<span style="font-size: 13.3333px;">&nbsp; &nbsp; &nbsp;</span>
</font>
<b style="font-family: &quot;Times New Roman&quot;; font-size: 10pt; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;http://lipidlibrary.aocs.org/Biochemistry/content.cfm<span class="GramE">?ItemNumber</span>=40317</span>
</b>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span class="SpellE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Mangold</span>
</b>
</span>
<b>
<span style="font-size: 11pt; font-family: Helvetica;">, H.K. and&nbsp;<span class="SpellE">Spener</span>, F.,&nbsp;</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">(1977).&nbsp;<span class="GramE">The&nbsp;<span class="SpellE">cyclopentenyl</span>&nbsp;fatty acids.</span>&nbsp;In&nbsp;Lipids and Lipid Polymers in Higher Plants&nbsp;(pp. 85-101).&nbsp;<span class="GramE">Springer Berlin Heidelberg.</span>
<b>&nbsp;ISBN: 978-3-642-66632-2&nbsp;</b>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span class="SpellE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Mawlong</span>
</b>
</span>
<b>
<span style="font-size: 11pt; font-family: Helvetica;">, I.,&nbsp;<span class="SpellE">Sujith</span>&nbsp;Kumar, M.S., and Singh, D. (</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">2014). Furan Fatty Acids: Their Role in Plant Systems.&nbsp;<span class="SpellE">
<span class="GramE">Phytochemistry</span>
</span>
<span class="GramE">&nbsp;Reviews 15, 121-127.</span>
<b>&nbsp;&nbsp;&nbsp;&nbsp;10.1007/s11101-014-9388-7<o:p>
</o:p>
</b>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span class="GramE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">McKeon, T., Hayes, D., Hildebrand, D., &amp;&nbsp;<span class="SpellE">Weselake</span>, R. (Eds.).</span>
</b>
</span>
<b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">(2016)<span class="GramE">.Industrial</span>&nbsp;Oil Crops. Elsevier.<b>&nbsp;<span class="GramE">eBook</span>&nbsp;ISBN :9780128053850<o:p>
</o:p>
</b>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Napier, J.A.&nbsp;</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">(2007).&nbsp;<span class="GramE">The Production of Unusual Fatty Acids in Transgenic Plants.</span>&nbsp;<span class="SpellE">Annu</span>&nbsp;Rev Plant&nbsp;<span class="SpellE">Biol</span>&nbsp;58, 295-319.<b>&nbsp;&nbsp;&nbsp;10.1146/annurev.arplant.58.032806.103811</b>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">
<b>
<o:p>
</o:p>
</b>
</span>
</p>

<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; text-align: justify; text-indent: -0.2in; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;">
<b>
<span style="font-size:11.0pt;font-family:Helvetica;mso-bidi-font-family:&quot;Times New Roman&quot;;
color:#333333">Shanklin, J., &amp; Cahoon, E. B.</span>
</b>
<span style="font-size:11.0pt;font-family:Helvetica;mso-bidi-font-family:&quot;Times New Roman&quot;;
color:#333333"> (1998). Desaturation and related modifications of fatty acids.&nbsp;Annual
Review of Plant Biology,&nbsp;49, 611-641.<b>&nbsp;<o:p>
</o:p>
</b>
</span>
<b>
<span style="font-family: Arial, Helvetica, sans-serif; font-size: 13.2px; line-height: normal;">DOI:&nbsp;</span>
<span class="hlFld-DOI" style="font-family: Arial, Helvetica, sans-serif; font-size: 13.2px; line-height: normal;">10.1146/annurev.arplant.49.1.611</span>
</b>
</p>

<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-family: Helvetica; font-size: 11pt;">
<o:p>
<b>Spitzer, V. </b>(1999)&nbsp;</o:p>
</span>
<span style="font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 14px;">Screening analysis of unknown seed oils</span>
<b style="font-family: &quot;Times New Roman&quot;; font-size: 10pt; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">
<o:p>&nbsp;</o:p>
</span>
</b>
<i style="font-family: Arial, sans-serif; font-size: 13px; color: rgb(34, 34, 34);">Lipid/Fett</i>
<span style="font-family: Arial, sans-serif; font-size: 13px; color: rgb(34, 34, 34);">,</span>
<i style="font-family: Arial, sans-serif; font-size: 13px; color: rgb(34, 34, 34);">101</i>
<span style="font-family: Arial, sans-serif; font-size: 13px; color: rgb(34, 34, 34);">(1), 2-19.&nbsp;</span>
<font color="#222222" face="Arial, sans-serif">
<span style="font-size: 13px;">
<b>doi:10.1002/(SICI)1521-4133(19991)101:1&lt;2::AID-LIPI2&gt;3.0.CO;2-H</b>
</span>
</font>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; line-height: normal; text-align: justify; text-indent: -0.2in;">
<font color="#222222" face="Arial, sans-serif">
<span style="font-size: 13px;">
<br>
</span>
</font>
</p>

<p class="MsoNormal" style="margin: 0in 0in 3pt 0.2in; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<b>
<span style="font-size: 12pt; font-family: Helvetica;">Selection of ~70 publications that include larger datasets<o:p>
</o:p>
</span>
</b>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">
<o:p>&nbsp;</o:p>
</span>
</b>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span class="SpellE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Appelqvist</span>
</b>
</span>
<b>
<span style="font-size: 11pt; font-family: Helvetica;">, L.A.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1971). Lipids in&nbsp;<span class="SpellE">Cruciferae</span>: Viii.&nbsp;<span class="GramE">The Fatty Acid Composition of Seeds of Some Wild or Partially Domesticated Species.</span>Journal of the American Oil Chemists Society&nbsp;<b>48,&nbsp;</b>740-744.&nbsp;&nbsp;&nbsp;&nbsp;<b>10.1007/BF02638533</b>
<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A total of 75 seed samples of 29 species of&nbsp;<span class="SpellE">Cruciferae</span>&nbsp;have been analyzed for fatty acid composition by gas chromatography. All but three species contained&nbsp;<span class="SpellE">erucic</span>&nbsp;acid in the seed oils at levels ranging from 1% to 57%.&nbsp;<span class="SpellE">Linolenic</span>&nbsp;acid was present in all samples; the levels ranged from 2% to 55%. A considerable variation in fatty acid patterns was observed at the intraspecific level for&nbsp;<span class="SpellE">Sinapis</span>&nbsp;<span class="SpellE">arvensis</span>. Species from five of the&nbsp;<span class="SpellE">generas</span>&nbsp;studied may have potential as new crops, namely&nbsp;<span class="SpellE">Barbarea</span>,&nbsp;<span class="SpellE">Conringia</span>,&nbsp;<span class="SpellE">Erysimum</span>,&nbsp;<span class="SpellE">Hesperis</span>&nbsp;and&nbsp;<span class="SpellE">Sisymbrium</span>.<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span class="SpellE">
<span class="GramE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Averna</span>
</b>
</span>
</span>
<span class="GramE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">, V.,&nbsp;<span class="SpellE">Lotti</span>, G., and&nbsp;<span class="SpellE">Tartaglia</span>, F.P.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1969).</span>
</span>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;<span class="GramE">Further Investigations on&nbsp;<span class="SpellE">Leguminosae</span>&nbsp;Seed Oils.</span>&nbsp;<span class="SpellE">
<span class="GramE">Rivista</span>
</span>
<span class="GramE">&nbsp;<span class="SpellE">Italiana</span>&nbsp;<span class="SpellE">delle</span>&nbsp;<span class="SpellE">Sostanze</span>&nbsp;Grasse&nbsp;<b>46,</b>602-606.</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Oils extracted with petroleum ether (<span class="SpellE">bp</span>&nbsp;40-70°C) from the seeds of 15 species of&nbsp;<span class="SpellE">Leguminosae</span>&nbsp;were&nbsp;<span class="SpellE">analysed</span>&nbsp;for&nbsp;<span class="SpellE">unsaponifiable</span>matter, % fatty acids, refractive index, I number and saponification&nbsp;<span class="SpellE">number.Purified</span>&nbsp;fatty acids were examined&nbsp;<span class="SpellE">spectrophotometrically</span>&nbsp;in the 232-308 nm range. DM, total N, ash, and ether extract were determined for the seeds.&nbsp;<span class="SpellE">Palmitic</span>, stearic, oleic, and linoleic acids were present in all the cases, the last 2 predominating. Conjugated double bonds were found in almost all the oils, whereas small amounts of acids with conjugated triple bonds were present in only a few cases. Of the 15 species studied only 2 had been previously investigated.<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span class="SpellE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Banerji</span>
</b>
</span>
<b>
<span style="font-size: 11pt; font-family: Helvetica;">, R.,&nbsp;<span class="SpellE">Chowdhury</span>, A.R.,&nbsp;<span class="SpellE">Misra</span>, G., and Nigam, S.K.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1984). Butter from Plants.&nbsp;<span class="SpellE">Fette</span>&nbsp;<span class="SpellE">Seifen</span>&nbsp;<span class="SpellE">Anstrichmittel</span>&nbsp;<b>86,&nbsp;</b>279-284.&nbsp;&nbsp;&nbsp;<b>10.1002/lipi.19840860706</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Barclay, A.S., and Earle, F.R.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1974).&nbsp;<span class="GramE">Chemical Analyses of Seeds Iii Oil and Protein Content of 1253 Species.</span>&nbsp;Economic Botany&nbsp;<b>28,&nbsp;</b>178-236.&nbsp;&nbsp;&nbsp;&nbsp;<b>10.1007/BF02861984</b>
<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Bohannon, M.B., and&nbsp;<span class="SpellE">Kleiman</span>, R.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1976).&nbsp;<span class="GramE">Γ-<span class="SpellE">Linolenic</span>&nbsp;Acid in Acer Seed Oils.</span>&nbsp;Lipids&nbsp;<b>11,&nbsp;</b>157-159.&nbsp;&nbsp;&nbsp;&nbsp;<b>10.1007/BF02532667</b>
<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The&nbsp;<span class="SpellE">octadecatrienoic</span>&nbsp;acids in Acer&nbsp;<span class="SpellE">negundo</span>&nbsp;L. (maple family) seed oil include both 9,12,15- (1%) and 6.9,12-(7%) isomers. The chief<span class="SpellE">monoenoic</span>&nbsp;acids identified were 9-octadecenoic (21%), 11-eicosenoic (7%), 13-docosenoic (15%), and 15-tetracosenoic (7%). Also present is a considerable amount of 9,12-octadecadienoic&nbsp;<span class="GramE">acid</span>. Investigation of ten other&nbsp;<span class="SpellE">Aceraceae</span>&nbsp;revealed their seed oils to have a similar fatty acid composition.<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Bohannon, M.B., and&nbsp;<span class="SpellE">Kleiman</span>, R.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1978).&nbsp;<span class="SpellE">
<span class="GramE">Cyclopropene</span>
</span>
<span class="GramE">&nbsp;Fatty Acids of Selected Seed Oils from&nbsp;<span class="SpellE">Bombacaceae</span>,&nbsp;<span class="SpellE">Malvaceae</span>, and<span class="SpellE">Sterculiaceae</span>.</span>&nbsp;Lipids&nbsp;<b>13,&nbsp;</b>270-273.&nbsp;&nbsp;&nbsp;&nbsp;<b>10.1007/BF02533669</b>
<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Fatty acid compositions of seed oils from three species of&nbsp;<span class="SpellE">Bombacaceae</span>, eleven from&nbsp;<span class="SpellE">Malvaceae</span>, and six from&nbsp;<span class="SpellE">Sterculiaceae</span>&nbsp;were determined. Each of the seed oils contains varying amounts of both&nbsp;<span class="SpellE">malvalic</span>&nbsp;and&nbsp;<span class="SpellE">sterculic</span>&nbsp;acids accompanied by one or both of the corresponding&nbsp;<span class="SpellE">cyclopropane</span>&nbsp;fatty acids. In addition, the seed oil of&nbsp;<span class="SpellE">Pachira</span>&nbsp;aquatic&nbsp;<span class="SpellE">Aubl</span>. (<span class="SpellE">Bombacaeae</span>) contains 12.8% α-<span class="SpellE">hydroxysterculic</span>acid.<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span class="GramE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Brown, A.J.,&nbsp;<span class="SpellE">Cherikoff</span>, V., and Roberts, D.C.K.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1987).</span>
</span>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;<span class="GramE">Fatty Acid Composition of Seeds from the Australian Acacia Species.</span>&nbsp;Lipids&nbsp;<b>22,&nbsp;</b>490-494.&nbsp;&nbsp;&nbsp;&nbsp;<b>10.1007/BF02540364</b>
<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Presented are the lipid content and fatty acid composition of 20 species of edible Australian Acacia seeds. Aborigines reportedly have used at least 18 of these as foods. Seed lipid content ranged from 3% to 22%, with an average of 11% on a dry weight basis. Linoleic (12-71%), oleic (12-56%) and&nbsp;<span class="SpellE">plamitic</span>&nbsp;(7-35%) acids were the major fatty acids. Smaller proportions of&nbsp;<span class="SpellE">behenic</span>, stearic and&nbsp;<span class="SpellE">vaccenic</span>&nbsp;acids were detected. Seventeen of the 20 species were found to have polyunsaturated to saturated (P/S) fatty acid ratios greater than 1, with four species having ratios in excess of 4. The persistent arils attached to the seeds of certain Australian Acacias and containing a portion of the total lipid were associated with a significantly reduced proportion of linoleic acid in the total seed material. This observation was explained by the aril lipid possessing a markedly different fatty acid composition from that of the seed lipid. For comparison, seeds from two non-Australian Acacia species (A.&nbsp;<span class="SpellE">farnesiana</span>&nbsp;and A.&nbsp;<span class="SpellE">cavenia</span>) were analyzed. Australian and non-Australian were found to exhibit markedly different fatty acid profiles.<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span class="SpellE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Chowdhury</span>
</b>
</span>
<b>
<span style="font-size: 11pt; font-family: Helvetica;">, A.R.,&nbsp;<span class="SpellE">Banerji</span>, R.,&nbsp;<span class="SpellE">Misra</span>, G., and Nigam, S.K.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1983).&nbsp;<span class="GramE">Chemical Composition of Acacia Seeds.</span>&nbsp;Journal of the American Oil Chemists' Society&nbsp;<b>60,&nbsp;</b>1893-1894.&nbsp;&nbsp;&nbsp;&nbsp;<b>10.1007/BF02901545</b>
<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Several plants of&nbsp;<span class="SpellE">Acacieae</span>&nbsp;(family&nbsp;<span class="SpellE">Leguminosae</span>) have been recommended under&nbsp;<span class="SpellE">aforestation</span>&nbsp;programs. The seeds of some such plants have been examined for their fatty acid composition with special reference to epoxy acids. Epoxy 18:1 in Acacia&nbsp;<span class="SpellE">auriculiformis</span>, A. catechu, A.&nbsp;<span class="SpellE">coriacea</span>&nbsp;and A.&nbsp;<span class="SpellE">mellifera</span>&nbsp;was 4.9, 0.1, 2.1, and 0.6%<span class="GramE">,respectively</span>..<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span class="SpellE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Chowdhury</span>
</b>
</span>
<b>
<span style="font-size: 11pt; font-family: Helvetica;">, A.R.,&nbsp;<span class="SpellE">Banerji</span>, R.,&nbsp;<span class="SpellE">Tiwari</span>, S.R.,&nbsp;<span class="SpellE">Misra</span>, G., and Nigam, S.K.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1986).&nbsp;<span class="GramE">Studies on Leguminous Seeds .3.</span>&nbsp;<span class="SpellE">Fette</span>&nbsp;<span class="SpellE">Seifen</span>&nbsp;<span class="SpellE">Anstrichmittel</span>
<b>88,&nbsp;</b>144-146.&nbsp;&nbsp;&nbsp;&nbsp;<b>10.1002/lipi.19860880407</b>
<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Christensen, L.P., and Brandt, K.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(2006). Acetylenes and&nbsp;<span class="SpellE">Psoralens</span>
<b>,&nbsp;</b>137-173.&nbsp;&nbsp;&nbsp;&nbsp;<b>10.1002/9780470988558.ch5</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span class="SpellE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Corneliu.Ja</span>
</b>
</span>
<b>
<span style="font-size: 11pt; font-family: Helvetica;">, Hammonds, T.W.,&nbsp;<span class="SpellE">Leiceste.Jb</span>,&nbsp;<span class="SpellE">Ndabahwe.Jk</span>, Rosie, D.A., and Shone, G.G.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1970). New Tropical Seed Oils .3.&nbsp;<span class="GramE">Component Acids of Leguminous and Other Seed Oils.</span>&nbsp;Journal of the Science of Food and Agriculture&nbsp;<b>21,&nbsp;</b>49-&amp;.&nbsp;&nbsp;&nbsp;&nbsp;<b>10.1002/jsfa.2740210114</b>&nbsp;&nbsp;&nbsp;<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span class="SpellE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Dembitsky</span>
</b>
</span>
<b>
<span style="font-size: 11pt; font-family: Helvetica;">, V.M., and&nbsp;<span class="SpellE">Srebnik</span>, M.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(2002). Natural Halogenated Fatty Acids: Their Analogues and Derivatives. Progress in Lipid Research&nbsp;<b>41,</b>315-367.&nbsp;&nbsp;&nbsp;&nbsp;<b>10.1016/s0163-7827(02)00003-6</b>&nbsp;&nbsp;<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span class="GramE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Dubois, V., Breton, S., Linder, M.,&nbsp;<span class="SpellE">Fanni</span>, J., and&nbsp;<span class="SpellE">Parmentier</span>, M.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(2007).</span>
</span>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;Fatty Acid Profiles of 80 Vegetable Oils with Regard to Their Nutritional Potential. European Journal of Lipid Science and Technology&nbsp;<b>109,&nbsp;</b>710-732.&nbsp;&nbsp;&nbsp;&nbsp;<b>10.1002/ejlt.200700040</b>
<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The current concern for fat intake in western countries has raised the question of the individual fatty acid (FA) impact on health. This important issue has strengthened the awareness of nutritionists and food manufacturers for the control of the FA profile of food products. The aim of this review is to provide a classification of the FA profiles of 80 vegetable oil sources, according to their nutritional potential. The first part of the review focuses on lipoprotein metabolism, and on the impact of each dietary FA on blood lipid composition (LDL-cholesterol, HDL-cholesterol and circulating&nbsp;<span class="SpellE">triacylglycerols</span>). In the second part of the review, the oil sources are clustered by similar FA profiles, and the classification is discussed with regard to the individual FA action on blood lipid composition. Apart from the major vegetable seeds, the clustering high-lighted some interesting nutritional oil sources containing mainly α-<span class="SpellE">linolenic</span>&nbsp;acid (<span class="SpellE">camelina</span>, linseed,&nbsp;<span class="SpellE">perilla</span>&nbsp;and stock oils), or interesting amounts of the two essential FA (<span class="SpellE">purslane</span>, chia, raspberry seed, sea buckthorn seed and&nbsp;<span class="SpellE">salicorn</span>&nbsp;oils). Furthermore, this classification provides a useful tool for the formulation of the FA profile of food products.<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Earle, F.R., and Jones, Q.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1962).&nbsp;<span class="GramE">Analyses of Seed Samples from 113 Plant Families.</span>&nbsp;Economic Botany&nbsp;<b>16,&nbsp;</b>221-250.&nbsp;&nbsp;&nbsp;<b>10.1007/BF02860181</b>
<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span class="SpellE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Gaydou</span>
</b>
</span>
<b>
<span style="font-size: 11pt; font-family: Helvetica;">, E.M., and&nbsp;<span class="SpellE">Ramanoelina</span>, A.R.P.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1983).&nbsp;<span class="GramE">A Survey of the&nbsp;<span class="SpellE">Sarcolaenaceae</span>&nbsp;for&nbsp;<span class="SpellE">Cyclopropene</span>&nbsp;Fatty Acids.</span>&nbsp;<span class="SpellE">Phytochemistry</span>&nbsp;<b>22,&nbsp;</b>1725-1728.&nbsp;&nbsp;&nbsp;&nbsp;<b>10.1016/S0031-9422(00)80259-9</b>
<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;An investigation of the fatty acid composition of 22 representative species of the 10 genera of the family&nbsp;<span class="SpellE">Sarcolaenaceae</span>&nbsp;yielded some results of chemotaxonomic interest. Two&nbsp;<span class="SpellE">cyclopropene</span>&nbsp;fatty acids,&nbsp;<span class="SpellE">malvalic</span>&nbsp;and&nbsp;<span class="SpellE">sterculic</span>&nbsp;<span class="GramE">acids,</span>&nbsp;were detected and quantitated in the seed oil of most species. The occurrence of&nbsp;<span class="SpellE">cyclopropene</span>&nbsp;fatty acids shows that this family has more biochemical affinities with the order<span class="SpellE">Malvales</span>&nbsp;than with the order&nbsp;<span class="SpellE">Parietales</span>.<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span class="SpellE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Gaydou</span>
</b>
</span>
<b>
<span style="font-size: 11pt; font-family: Helvetica;">, E.M., and&nbsp;<span class="SpellE">Ramanoelina</span>, A.R.P.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1983). Study on Fatty-Acid Composition of Vegetable Seed Oils from Madagascar. Revue<span class="SpellE">Francaise</span>&nbsp;Des Corps Gras&nbsp;<b>30,&nbsp;</b>21-25.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span class="SpellE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Gaydou</span>
</b>
</span>
<b>
<span style="font-size: 11pt; font-family: Helvetica;">, E.M., and&nbsp;<span class="SpellE">Ramanoelina</span>, A.R.P.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1984).&nbsp;<span class="SpellE">Cyclopropenoic</span>&nbsp;<span class="GramE">Fatty-Acids</span>&nbsp;of&nbsp;<span class="SpellE">Malvaceae</span>&nbsp;Seed Oils by Gas-Liquid-Chromatography.&nbsp;<span class="SpellE">Fette</span>
<span class="SpellE">Seifen</span>&nbsp;<span class="SpellE">Anstrichmittel</span>&nbsp;<b>86,&nbsp;</b>82-84.&nbsp;&nbsp;&nbsp;&nbsp;<b>10.1002/lipi.19840860208</b>
<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span class="SpellE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Gaydou</span>
</b>
</span>
<b>
<span style="font-size: 11pt; font-family: Helvetica;">, E.M.,&nbsp;<span class="SpellE">Ramanoelina</span>, A.R.P.,&nbsp;<span class="SpellE">Rasoarahona</span>, J.R.E., and&nbsp;<span class="SpellE">Combres</span>, A.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1993).&nbsp;<span class="GramE">Fatty-Acid Composition of&nbsp;<span class="SpellE">Sterculia</span>&nbsp;Seeds and Oils from Madagascar.</span>&nbsp;Journal of Agricultural and Food Chemistry&nbsp;<b>41,&nbsp;</b>64-66.&nbsp;&nbsp;&nbsp;&nbsp;<b>10.1021/jf00025a014</b>
<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The percentage contents of oil and protein in the seeds of 17 species belonging to 9 genera of the&nbsp;<span class="SpellE">Sterculiaceae</span>&nbsp;family, growing in Madagascar, were determined. The major fatty acids were&nbsp;<span class="SpellE">palmitic</span>&nbsp;(11.6-27.5%), oleic (8.3-32.6%), linoleic (4.2-45.8%),&nbsp;<span class="SpellE">malvalic</span>&nbsp;(tr-53.7%), and&nbsp;<span class="SpellE">sterculic</span>&nbsp;(1.3-24.8%) acids.&nbsp;<span class="SpellE">Heritiera</span>&nbsp;<span class="SpellE">littoralis</span>&nbsp;seed oil was characterized by a high content of&nbsp;<span class="SpellE">malvalic</span>&nbsp;(53.7 %) and&nbsp;<span class="SpellE">sterculic</span>
<span class="GramE">acids(</span>12.4%).&nbsp;<span class="SpellE">Cyclopropene</span>&nbsp;fatty acids were identified and determined by using a combination of gas chromatographic and H-1 and C-13 NMR analyses.&nbsp;<span class="SpellE">Dihydrosterculic</span>&nbsp;acid was also detected in all samples at a low concentration.<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span class="SpellE">
<span class="GramE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Goffman</span>
</b>
</span>
</span>
<span class="GramE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">, F.D.,&nbsp;<span class="SpellE">Thies</span>, W., and Velasco, L.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1999).</span>
</span>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;<span class="GramE">Chemotaxonomic Value of&nbsp;<span class="SpellE">Tocopherols</span>&nbsp;in Brassicaceae.</span>&nbsp;<span class="SpellE">Phytochemistry</span>&nbsp;<b>50,&nbsp;</b>793-798.&nbsp;&nbsp;&nbsp;<b>10.1016/S0031-9422(98)00641-4</b>
<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The significance of&nbsp;<span class="SpellE">tocopherols</span>&nbsp;as chemotaxonomic markers and their relationship with oil content and fatty acid profile was investigated in a collection of 91 species of the family Brassicaceae. Total&nbsp;<span class="SpellE">tocopherols</span>&nbsp;content ranged from 68 mg kg-1 oil in&nbsp;<span class="SpellE">Diplotaxis</span>
<span class="SpellE">viminea</span>&nbsp;to 2479 mg kg-1 oil in&nbsp;<span class="SpellE">Schivereckia</span>&nbsp;<span class="SpellE">doerfleri</span>. The collection also showed wide variability for&nbsp;<span class="SpellE">tocopherol</span>&nbsp;composition. The average<span class="SpellE">tocopherol</span>&nbsp;profile consisted of 65.4% γ-, 28.7% α-, 5.1% δ- and&nbsp;<span class="GramE">0.8 β-<span class="SpellE">tocopherol</span>
</span>. Individual&nbsp;<span class="SpellE">tocopherols</span>&nbsp;were found to have great taxonomic value in the Brassicaceae.<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Graham, S.A.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1989).&nbsp;<span class="SpellE">Cuphea</span>&nbsp;- a New Plant Source of Medium-Chain&nbsp;<span class="GramE">Fatty-Acids</span>. Critical Reviews in Food Science and Nutrition&nbsp;<b>28,&nbsp;</b>139-173.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span class="GramE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Graham, S.A., and&nbsp;<span class="SpellE">Kleiman</span>, R.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1987).</span>
</span>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;<span class="GramE">Seed Lipids of the&nbsp;<span class="SpellE">Lythraceae</span>.</span>&nbsp;Biochemical Systematics and Ecology&nbsp;<b>15,&nbsp;</b>433-439.&nbsp;&nbsp;&nbsp;&nbsp;<b>10.1016/0305-1978(87)90057-3</b>
<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Fatty acid composition of seed lipids for 20 of the 26 genera in the&nbsp;<span class="SpellE">Lythraceae</span>&nbsp;and seed oil and protein content for nine genera are reported. The percent oil ranges from 2.7 to 34% of total weight and protein from 11.3 to 24.9%. Linoleic acid is the dominant fatty acid in seed lipids of all genera surveyed. Variations in pattern emphasize&nbsp;<span class="SpellE">palmitic</span>&nbsp;or oleic acid or both as second most abundant lipid component. There are three exceptions: in&nbsp;<span class="SpellE">Diplusodon</span>&nbsp;<span class="SpellE">capric</span>&nbsp;acid ranks second in abundance; in&nbsp;<span class="SpellE">Adenaria</span>&nbsp;<span class="SpellE">lauric</span>&nbsp;acid and oleic acid occur in approximately equal amounts as second most abundant fatty acid; in&nbsp;<span class="SpellE">Decodon</span>&nbsp;an unusual&nbsp;<span class="SpellE">trienoic</span>&nbsp;acid, previously reported only from the<span class="SpellE">Compositae</span>, is the main secondary component. Fatty acid composition of seeds in the genera is compared to that of the previously studied<span class="SpellE">lythraceous</span>&nbsp;genus&nbsp;<span class="SpellE">Cuphea</span>. Among all the genera, only&nbsp;<span class="SpellE">Cuphea</span>&nbsp;seed produces large quantities of&nbsp;<span class="SpellE">lauric</span>,&nbsp;<span class="SpellE">capric</span>, or&nbsp;<span class="SpellE">caprylic</span>&nbsp;acids, as well as a diversity of fatty acid patterns. No relationship between oil content or seed weight and habit is apparent in any genus studied, nor are differences in seed morphology reflected in composition of the seed lipids. The fatty acid patterns are judged evolutionarily conservative, with the strong exception of&nbsp;<span class="SpellE">Cuphea</span>, which remains unique in the&nbsp;<span class="SpellE">Lythraceae</span>&nbsp;and among all angiosperms for the diversity of patterns displayed.<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span class="SpellE">
<span class="GramE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Guil</span>
</b>
</span>
</span>
<span class="GramE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">-Guerrero, J.L., Gómez-Mercado, F.,&nbsp;<span class="SpellE">García-Maroto</span>, F., and&nbsp;<span class="SpellE">Campra</span>-Madrid, P.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(2000).</span>
</span>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;Occurrence and Characterization of Oils Rich in Γ-<span class="SpellE">Linolenic</span>&nbsp;Acid Part I:&nbsp;<span class="SpellE">Echium</span>&nbsp;Seeds from&nbsp;<span class="SpellE">Macaronesia</span>.&nbsp;<span class="SpellE">Phytochemistry</span>&nbsp;<b>53,&nbsp;</b>451-456.&nbsp;&nbsp;&nbsp;&nbsp;<b>10.1016/S0031-9422(99)00549-X</b>
<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Nineteen species of the genus&nbsp;<span class="SpellE">Echium</span>&nbsp;(Fam.&nbsp;<span class="SpellE">Boraginaceae</span>) collected in&nbsp;<span class="SpellE">Macaronesia</span>&nbsp;were surveyed in a search for new sources of γ-<span class="SpellE">linolenic</span>&nbsp;acid (GLA, 18:3ω6). High amounts of this acid were found in all of them, ranging from 9.15% (E.&nbsp;<span class="SpellE">plantagineum</span>) to 26.31% (E.<span class="SpellE">callithyrsum</span>) of total seed fatty acids. The amounts of GLA related to total seed weight were also significant, ranging from 1.77% (E.<span class="SpellE">sventenii</span>) to 5.02% (E.&nbsp;<span class="SpellE">nervosum</span>). In addition, considerable amounts of&nbsp;<span class="SpellE">stearidonic</span>&nbsp;acid (SA, 18:4ω3) were detected, ranging from 3.03% (E.&nbsp;<span class="SpellE">auberianum</span>) to 12.94% (E.&nbsp;<span class="SpellE">plantagineum</span>) of total fatty acids. These data allow us to consider the members of the genus&nbsp;<span class="SpellE">Echium</span>&nbsp;from<span class="SpellE">Macaronesia</span>&nbsp;as one of the richest sources of γ-<span class="SpellE">linolenic</span>&nbsp;acid found so far in nature. The&nbsp;<span class="GramE">results obtained from multivariable data analysis and the taxonomic relationships among the species is</span>&nbsp;discussed.<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span class="SpellE">
<span class="GramE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Guil</span>
</b>
</span>
</span>
<span class="GramE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">-Guerrero, J.L.,&nbsp;<span class="SpellE">López-Martínez</span>, J.C., Gómez-Mercado, F., and&nbsp;<span class="SpellE">Campra</span>-Madrid, P.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(2006).</span>
</span>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;<span class="GramE">Gamma-<span class="SpellE">Linolenic</span>&nbsp;and&nbsp;<span class="SpellE">Stearidonic</span>&nbsp;Acids from Moroccan&nbsp;<span class="SpellE">Boraginaceae</span>.</span>&nbsp;European Journal of Lipid Science and Technology&nbsp;<b>108,&nbsp;</b>43-47.&nbsp;&nbsp;&nbsp;&nbsp;<b>10.1002/ejlt.200500251</b>
<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seeds from 20 species belonging to&nbsp;<span class="SpellE">Boraginaceae</span>, subfamilies&nbsp;<span class="SpellE">Boraginoideae</span>&nbsp;and&nbsp;<span class="SpellE">Heliotropioideae</span>, were surveyed in a search for new sources of γ-<span class="SpellE">linolenic</span>&nbsp;acid (GLA) and&nbsp;<span class="SpellE">stearidonic</span>&nbsp;acid (SDA). Seed oil content ranged from 7.5% in&nbsp;<span class="SpellE">Echium</span>&nbsp;<span class="SpellE">humile</span>&nbsp;ssp.&nbsp;<span class="SpellE">pycnanthum</span>&nbsp;to 28.8% in&nbsp;<span class="SpellE">Anchusa</span>&nbsp;<span class="SpellE">undulata</span>. GLA ranged from 0.2% of total fatty acids in&nbsp;<span class="SpellE">Heliotropium</span>&nbsp;<span class="SpellE">undulatum</span>&nbsp;to 20.2% in&nbsp;<span class="SpellE">Lithodora</span>&nbsp;<span class="SpellE">maroccana</span>. This last species may be considered as new source of GLA. GLA content was also tested in other&nbsp;<span class="SpellE">Lithodora</span>&nbsp;species from the south east of Spain, to compare GLA percentages among related taxa. GLA amounts in all&nbsp;<span class="SpellE">Echium</span>&nbsp;species reached approximately 12%, in good agreement with previous findings in other European&nbsp;<span class="SpellE">Echium</span>&nbsp;species. SDA ranged from an absence in several&nbsp;<span class="SpellE">Cynoglossum</span>&nbsp;species to 16.2% in&nbsp;<span class="SpellE">Echium</span>&nbsp;<span class="SpellE">humile</span>&nbsp;ssp.&nbsp;<span class="SpellE">pycnanthum</span>, which may be considered as a new source of this fatty acid.<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span class="SpellE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Gunstone</span>
</b>
</span>
<b>
<span style="font-size: 11pt; font-family: Helvetica;">, F.D., Hammonds, T.W., Steward, S.R., and&nbsp;<span class="SpellE">Corneliu.Ja</span>.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1972). New Tropical Seed Oils .4. Component Acids of Leguminous and Other Seed Oils Including Useful Sources of&nbsp;<span class="SpellE">Crepenynic</span>&nbsp;and&nbsp;<span class="SpellE">Dehydrocrepenynic</span>&nbsp;Acid. Journal of the Science of Food and Agriculture<b>23,&nbsp;</b>53-&amp;.&nbsp;&nbsp;&nbsp;&nbsp;<b>10.1002/jsfa.2740230108</b>
<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span class="SpellE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Gunstone</span>
</b>
</span>
<b>
<span style="font-size: 11pt; font-family: Helvetica;">, F.D., Taylor, G.M.,&nbsp;<span class="SpellE">Corneliu.Ja</span>, and Hammonds, T.W.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1968). New Tropical Seed Oils .2.&nbsp;<span class="GramE">Component Acids of Leguminous and Other Seed Oils.</span>&nbsp;Journal of the Science of Food and Agriculture&nbsp;<b>19,&nbsp;</b>706-&amp;.&nbsp;&nbsp;&nbsp;&nbsp;<b>10.1002/jsfa.2740191205</b>&nbsp;&nbsp;<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span class="SpellE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Hagemann</span>
</b>
</span>
<b>
<span style="font-size: 11pt; font-family: Helvetica;">, J.M., Earle, F.R., Wolff, I.A., and Barclay, A.S.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1967). Search for New Industrial Oils. Xiv. Seed Oils of&nbsp;<span class="SpellE">Labiatae</span>. Lipids&nbsp;<b>2,&nbsp;</b>371-380.&nbsp;&nbsp;&nbsp;&nbsp;<b>10.1007/BF02531850</b>
<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seed of 194 species in 56 genera of&nbsp;<span class="SpellE">Labiatae</span>, representing six of the eight subfamilies, were analyzed for oil and protein and for fatty acid composition of the oil. The oils are diverse and include some that contain up to 70% oleic acid, 79% linoleic acid, or 72%&nbsp;<span class="SpellE">linolenic</span>&nbsp;acid. An&nbsp;<span class="SpellE">allenic</span>&nbsp;function occurs in a third of the samples from the subfamily&nbsp;<span class="SpellE">Stachyoideae</span>&nbsp;and in the one sample analyzed from the&nbsp;<span class="SpellE">Prasioideae</span>. A method for determining the&nbsp;<span class="SpellE">allene</span>&nbsp;was devised. Oils from&nbsp;<span class="SpellE">Teucrium</span>&nbsp;species contain trans unsaturation in unidentified components. Oils from two&nbsp;<span class="SpellE">Lamium</span>&nbsp;species have both&nbsp;<span class="SpellE">allenic</span>&nbsp;and trans unsaturation. Two species of Thymus appear to produce hydroxy acids.<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Hayes, D.G.,&nbsp;<span class="SpellE">Kleiman</span>, R., and Phillips, B.S.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1995). The Triglyceride Composition, Structure, and Presence of&nbsp;<span class="SpellE">Estolides</span>&nbsp;in the Oils of<span class="SpellE">Lesquerella</span>&nbsp;and Related Species. Journal of the American Oil Chemists’ Society&nbsp;<b>72,&nbsp;</b>559-569.&nbsp;&nbsp;&nbsp;&nbsp;<b>10.1007/BF02638857</b>
<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Members of the genus&nbsp;<span class="SpellE">Lesquerella</span>, native to North America, have oils containing large amounts of hydroxy fatty acids and are under investigation as potential new crops. The triglyceride structure of oils from twenty-five&nbsp;<span class="SpellE">Lesquerella</span>&nbsp;species in the seed collection at our research center has been examined after being hydrolysis-catalyzed by reverse&nbsp;<span class="SpellE">micellar</span>-encapsulated lipase and&nbsp;<span class="SpellE">alcoholysis</span>-catalyzed by immobilized lipase. These reactions, when coupled with supercritical-fluid chromatographic analysis, provide a powerful, labor-saving method for oil triglyceride analysis. A comprehensive analysis of overall fatty acid composition of these oils has been conducted as well.<span class="SpellE">Lesquerella</span>&nbsp;oils (along with oils from two other Brassicaceae: Physaria floribunda and&nbsp;<span class="SpellE">Heliophilia</span>&nbsp;<span class="SpellE">amplexicaulis</span>) have been grouped into five categories:&nbsp;<span class="SpellE">densipolic</span>&nbsp;acid-rich (Class I);&nbsp;<span class="SpellE">auricolic</span>&nbsp;acid-rich (Class II);&nbsp;<span class="SpellE">lesquerolic</span>&nbsp;acid-rich (Class III); an oil containing a mixture of hydroxy acids (Class IV); and&nbsp;<span class="SpellE">lesquerolic</span>&nbsp;and&nbsp;<span class="SpellE">erucic</span>&nbsp;acid-rich (Class V). The majority of Class I and II triglycerides contain one or two<span class="SpellE">monoestolides</span>&nbsp;at the 1- and 3-glycerol positions and a C18 polyunsaturated acyl group at the 2-position. Most Class III and IV oil triglycerides contain one or two hydroxy acids at the 1- and 3-positions and C18 unsaturated acid at the 2-position. A few of the Class III oils have trace amounts of&nbsp;<span class="SpellE">estolides</span>. The Class V oil triglycerides are mostly&nbsp;<span class="SpellE">pentaacyl</span>&nbsp;triglycerides and contain&nbsp;<span class="SpellE">monestolide</span>&nbsp;and small amounts of&nbsp;<span class="SpellE">diestolide</span>. Our triglyceride structure assignments were supported by1H nuclear magnetic resonance data and mass balances.<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span class="SpellE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Idiemopute</span>
</b>
</span>
<b>
<span style="font-size: 11pt; font-family: Helvetica;">, F.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1979).&nbsp;<span class="GramE">Seed Lipids of the Palm Family.</span>&nbsp;Journal of the American Oil Chemists Society&nbsp;<b>56,&nbsp;</b>528-530.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Jamieson, G.R., and Reid, E.H.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1972).&nbsp;<span class="GramE">The Leaf Lipids of Some Conifer Species.</span>&nbsp;<span class="SpellE">Phytochemistry</span>&nbsp;<b>11,&nbsp;</b>269-275.&nbsp;&nbsp;&nbsp;&nbsp;<b>10.1016/S0031-9422(00)90002-5</b>
<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Conifer leaf lipids contain, in addition to the fatty acids found in angiosperms, a series of polyunsaturated acids with Δ5&nbsp;<span class="SpellE">olefinic</span>unsaturation. All the species contain Δ5 C20 acids and the members of the family,&nbsp;<span class="SpellE">Pinaceae</span>, contain, in addition a series of C18 Δ5 acids. Significant amounts of a saturated C17 branched-chain acid were present in many of the species. The distribution of polyunsaturated acids among certain lipid classes was investigated and it was found that C16 and C18 polyunsaturated acids with ω3 unsaturation are concentrated in the&nbsp;<span class="SpellE">galactosyl</span>&nbsp;<span class="SpellE">diglycerides</span>.<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span class="SpellE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Jart</span>
</b>
</span>
<b>
<span style="font-size: 11pt; font-family: Helvetica;">, A.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1978).&nbsp;<span class="GramE">The Fatty Acid Composition of Various Cruciferous Seeds.</span>&nbsp;Journal of the American Oil Chemists' Society&nbsp;<b>55,&nbsp;</b>873-875.&nbsp;&nbsp;&nbsp;<b>10.1007/BF02671410</b>
<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seeds from 26&nbsp;<span class="SpellE">Cruciferae</span>&nbsp;species in 7 genera have been investigated for fat content and fatty acid composition of the oil. The GLC retention data have been verified by mass spectrometry. The oil from&nbsp;<span class="SpellE">Cardamine</span>&nbsp;<span class="SpellE">graeca</span>&nbsp;contained 54% of cis-15-tetracosenoic acid; it is the highest content of this acid so far reported in any seed fat.<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Jones, Q., and Earle, F.R.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1966). Chemical Analyses of Seeds Ii: Oil and Protein Content of 759 Species. Economic Botany&nbsp;<b>20,&nbsp;</b>127-155.&nbsp;&nbsp;&nbsp;<b>10.1007/BF02904010</b>
<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span class="SpellE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Kleiman</span>
</b>
</span>
<b>
<span style="font-size: 11pt; font-family: Helvetica;">, R., Earle, F.R., Wolff, I.A., and Jones, Q.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1964). Search for New Industrial Oils. Xi. Oils of&nbsp;<span class="SpellE">Boraginaceae</span>. Journal of the American Oil Chemists' Society&nbsp;<b>41,&nbsp;</b>459-460.&nbsp;&nbsp;&nbsp;&nbsp;<b>10.1007/BF02670021</b>
<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Analysis of seed oils from 29 species of the family&nbsp;<span class="SpellE">Boraginaceae</span>&nbsp;revealed widespread occur-<span class="SpellE">rence</span>&nbsp;of 6,9,12-octadecatrienoic and C18&nbsp;<span class="SpellE">noncon-jugated</span>&nbsp;<span class="SpellE">tetraenoic</span>&nbsp;acids in addition to&nbsp;<span class="SpellE">linolenic</span>&nbsp;and other common C16 and C18 acids. The 6,9,12-octadecatrienoic acid ranged in amount from 0-27%,&nbsp;<span class="SpellE">tetraene</span>&nbsp;from 0-17%, and&nbsp;<span class="SpellE">linolenic</span>&nbsp;acid from 0.3-50%. Iodine values of the oils ranged from 88-225.<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span class="SpellE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Kleiman</span>
</b>
</span>
<b>
<span style="font-size: 11pt; font-family: Helvetica;">, R., and Payne-Wahl, K.L.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1984).&nbsp;<span class="GramE">Fatty Acid Composition of Seed Oils of the&nbsp;<span class="SpellE">Meliaceae</span>, Including One Genus Rich in&nbsp;<span class="SpellE">Cis-Vaccenic</span>Acid.</span>&nbsp;Journal of the American Oil Chemists' Society&nbsp;<b>61,&nbsp;</b>1836-1838.&nbsp;&nbsp;&nbsp;&nbsp;<b>10.1007/BF02540810</b>
<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The seed lipids of three species of&nbsp;<span class="SpellE">Entandraphragma</span>&nbsp;(<span class="SpellE">Meliaceae</span>) contain the largest proportion (31-50%) of&nbsp;<span class="SpellE">cis-vaccenic</span>&nbsp;acid ever found in nature. The acid is not indicative of the family as a whole and is found as a major fatty acid in the seed of only one additional species, besides&nbsp;<span class="SpellE">Entandraphragma</span>, out of the 30 analyzed from this family. With the total oil comprising between 45 and 62% of<span class="SpellE">Entandraphragma</span>&nbsp;seed, these species should be considered as a source of&nbsp;<span class="SpellE">undecadioic</span>&nbsp;acid for the production of nylon 11.<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span class="SpellE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Kleiman</span>
</b>
</span>
<b>
<span style="font-size: 11pt; font-family: Helvetica;">, R., Smith&nbsp;<span class="SpellE">Jr</span>, C.R., Yates, S.G., and Jones, Q.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1965). Search for New Industrial Oils. Xii. Fifty-Eight&nbsp;<span class="SpellE">Euphorbiaceae</span>&nbsp;Oils, Including One Rich in&nbsp;<span class="SpellE">Vernolic</span>&nbsp;Acid. Journal of the American Oil Chemists' Society&nbsp;<b>42,&nbsp;</b>169-172.&nbsp;&nbsp;&nbsp;&nbsp;<b>10.1007/BF02541123</b>
<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seed oil of Euphorbia&nbsp;<span class="SpellE">lagascae</span>&nbsp;<span class="SpellE">Spreng</span>.&nbsp;<span class="GramE">contains</span>&nbsp;57% of cis-12,13-epoxy-cis-9-octadecenoic (<span class="SpellE">vernolic</span>) acid. The&nbsp;<span class="SpellE">amt</span>&nbsp;of&nbsp;<span class="SpellE">trivernolin</span>&nbsp;in the glycerides of this species indicates random or restricted random distribution of the&nbsp;<span class="SpellE">vernolic</span>&nbsp;acid. Seed from 57 additional species in the<span class="SpellE">Euphorbiaceae</span>&nbsp;were analyzed for oil and protein contents and also for fatty acid composition of the oils. Iodine values (I.V.) of the oils ranged from 87-221. Among these oils, samples were encountered with as much as 76%&nbsp;<span class="SpellE">linolenic</span>, 77% linoleic or 84% oleic acid.<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span class="SpellE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Kleiman</span>
</b>
</span>
<b>
<span style="font-size: 11pt; font-family: Helvetica;">, R., and Spencer, G.F.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1982). Search for New Industrial Oils: Xvi.&nbsp;<span class="SpellE">
<span class="GramE">Umbelliflorae</span>
</span>
<span class="GramE">-Seed Oils Rich in&nbsp;<span class="SpellE">Petroselinic</span>&nbsp;Acid.</span>&nbsp;Journal of the American Oil Chemists' Society&nbsp;<b>59,&nbsp;</b>29-38.&nbsp;&nbsp;&nbsp;&nbsp;<b>10.1007/BF02670064</b>
<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seed oils of the order&nbsp;<span class="SpellE">Umbelliflorae</span>, including those from the families&nbsp;<span class="SpellE">Umbelliferae</span>,&nbsp;<span class="SpellE">Garryaceae</span>,&nbsp;<span class="SpellE">Araliaceae</span>,&nbsp;<span class="SpellE">Cornaceae</span>,&nbsp;<span class="SpellE">Davidiaceae</span>,<span class="SpellE">Nyssaceae</span>&nbsp;and&nbsp;<span class="SpellE">Alangiaceae</span>, were analyzed for fatty acid composition by gas liquid chromatography (GLC) of their methyl esters. The characteristic fatty acid of the order,&nbsp;<span class="SpellE">petroselinic</span>&nbsp;acid, occurred in the&nbsp;<span class="SpellE">Umbelliferae</span>&nbsp;in amounts up to 85%. In the&nbsp;<span class="SpellE">Araliaceae</span>, the content was as high as 83% and in the&nbsp;<span class="SpellE">Garryaceae</span>&nbsp;as high as 81%. The other major acids were&nbsp;<span class="SpellE">palmitic</span>, oleic and linoleic acids, with small amounts of&nbsp;<span class="SpellE">hexadecenoic</span>, stearic,&nbsp;<span class="SpellE">linolenic</span>, and, in some cases, C20 acids.&nbsp;<span class="SpellE">
<span class="GramE">petroselinic</span>
</span>&nbsp;acid was determined by&nbsp;<span class="SpellE">microscale</span>&nbsp;<span class="SpellE">ozonolysis</span>&nbsp;of the C18&nbsp;<span class="SpellE">monoenoic</span>&nbsp;esters and subsequent GLC of the&nbsp;<span class="SpellE">ozonolysis</span>&nbsp;products. The occurrence of high oil contents (up to 46%) combined with exceptionally high (up to 83%) single component purity is notable and emphasizes the potential of the&nbsp;<span class="SpellE">Umbelliflorae</span>&nbsp;as a raw material source for the chemical industry.<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span class="SpellE">
<span class="GramE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Koiwai</span>
</b>
</span>
</span>
<span class="GramE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">, A., Suzuki, F.,&nbsp;<span class="SpellE">Matsuzaki</span>, T., and Kawashima, N.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1983).</span>
</span>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;<span class="GramE">The Fatty Acid Composition of Seeds and Leaves of&nbsp;<span class="SpellE">Nicotiana</span>&nbsp;Species.</span>
<span class="SpellE">Phytochemistry</span>&nbsp;<b>22,&nbsp;</b>1409-1412.&nbsp;&nbsp;&nbsp;&nbsp;<b>10.1016/S0031-9422(00)84024-8</b>
<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Fatty acid analyses of seeds in 62&nbsp;<span class="SpellE">Nicotiana</span>&nbsp;species and leaves in 56&nbsp;<span class="SpellE">Nicotiana</span>&nbsp;species are presented. The total fatty acid content on a dry&nbsp;<span class="SpellE">wt</span>&nbsp;basis ranged from 25 to 40 %of seeds and from 2.1 to4.4% of green leaves.&nbsp;<span class="SpellE">Linolenate</span>&nbsp;was the dominant fatty acid in the leaves of all species studied, comprising 50-63% of the total fatty acid content. In seeds of most species&nbsp;<span class="SpellE">linoleate</span>&nbsp;predominated, constituting 69-79% of the total fatty acid content. Fourteen of 21 species in the section&nbsp;<span class="SpellE">Suaveolentes</span>&nbsp;and one species in the section&nbsp;<span class="SpellE">Noctiflorae</span>&nbsp;had relatively high proportions (10-38%) of&nbsp;<span class="SpellE">linolenate</span>. In two&nbsp;<span class="SpellE">linolenate</span>-rich species studied,&nbsp;<span class="SpellE">linolenate</span>&nbsp;was the major fatty acid of&nbsp;<span class="SpellE">triacylglycerols</span>&nbsp;which predominated in the seed lipids.<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Kumar, P.R., and&nbsp;<span class="SpellE">Tsunoda</span>, S.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1978).&nbsp;<span class="GramE">Fatty Acid Spectrum of Mediterranean Wild&nbsp;<span class="SpellE">Cruciferae</span>.</span>&nbsp;Journal of the American Oil Chemists' Society<b>55,&nbsp;</b>320-323.&nbsp;&nbsp;&nbsp;&nbsp;<b>10.1007/BF02669920</b>
<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seed samples of 54 species of wild&nbsp;<span class="SpellE">Cruciferae</span>&nbsp;were newly collected from natural populations of the west Mediterranean and adjacent areas in a search for "new" oil crops. Oil contents and fatty acid compositions were determined simultaneously by gas liquid chromatography using methyl&nbsp;<span class="SpellE">heptadecanoate</span>&nbsp;as the internal standard. The study revealed large variations in oil content (6-48.8%), oleic acid (5-31.3%), linoleic acid (2-24.8%),&nbsp;<span class="SpellE">linolenic</span>&nbsp;acid (1.7-64.1%), and&nbsp;<span class="SpellE">erucic</span>&nbsp;acid (0-55.1%). Correlation coefficients between component fatty acids inter se and oil content were determined separately for all species, the tribe&nbsp;<span class="SpellE">Brassiceae</span>, and the genus Brassica. The promising species identified are being studied further.<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span class="SpellE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Lotti</span>
</b>
</span>
<b>
<span style="font-size: 11pt; font-family: Helvetica;">, G., and&nbsp;<span class="SpellE">Galoppini</span>, C.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1965).&nbsp;<span class="GramE">Nature of the Lipids in the Germ and Reserve Tissues of Seeds.</span>&nbsp;<span class="SpellE">
<span class="GramE">Rivista</span>
</span>
<span class="GramE">&nbsp;<span class="SpellE">Italiana</span>&nbsp;<span class="SpellE">delle</span>&nbsp;<span class="SpellE">Sostanze</span>&nbsp;Grasse<b>42,&nbsp;</b>289-297.</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The content of oil and its characteristics and fatty acid composition were determined in the germ and reserve tissue of 42 species of vegetables from 14 families. Appreciable differences in fatty acid composition were often shown in the oil from the germ and reserve tissue, particularly in the proportion of linoleic and oleic acids.<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span class="SpellE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Lotti</span>
</b>
</span>
<b>
<span style="font-size: 11pt; font-family: Helvetica;">, G.,&nbsp;<span class="SpellE">Paradossi</span>, C., and&nbsp;<span class="SpellE">Marchini</span>, F.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1985).&nbsp;<span class="GramE">Analytical Characterization of New Seed Oils.</span>&nbsp;<span class="SpellE">Rivista</span>&nbsp;<span class="SpellE">
<span class="GramE">della</span>
</span>&nbsp;<span class="SpellE">Societa</span>&nbsp;<span class="SpellE">Italiana</span>&nbsp;di&nbsp;<span class="SpellE">Scienza</span>
<span class="SpellE">dell'Alimentazione</span>&nbsp;<b>14,&nbsp;</b>263-270.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Analytical characteristics are given for novel seed oils from 37 plant species from 27 families, including data for oil content, UV extinction values at 8 wavelengths in the range 232-315 nm, and fatty acid compositions. Individual oils are discussed in detail.<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span class="SpellE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Lotti</span>
</b>
</span>
<b>
<span style="font-size: 11pt; font-family: Helvetica;">, G.,&nbsp;<span class="SpellE">Paradossi</span>, C., and&nbsp;<span class="SpellE">Marchini</span>, F.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1991).&nbsp;<span class="GramE">Composition of New Seed Oils.</span>&nbsp;<span class="SpellE">Agrochimica</span>&nbsp;<b>35,&nbsp;</b>58-68.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The&nbsp;<span class="SpellE">behaviour</span>&nbsp;in the U.V. and I.R.-lights and the fatty acid composition by&nbsp;<span class="SpellE">gaschromatography</span>&nbsp;of the oils extracted from the seeds of 30 plant species belonging to different families were determined. Results have shown in many oils, in addition to the fundamental fatty acids, the presence of particular acids, such as&nbsp;<span class="SpellE">octadecatetraenoic</span>,&nbsp;<span class="SpellE">eicosenoic</span>&nbsp;and&nbsp;<span class="SpellE">eicosentrienoic</span>, besides&nbsp;<span class="SpellE">epoxiacids</span>,&nbsp;<span class="SpellE">allenic</span>&nbsp;acids and<span class="SpellE">trienoic</span>&nbsp;acids with an isolated trans double bond.<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span class="GramE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Marin, P.,&nbsp;<span class="SpellE">Sajdl</span>, V.,&nbsp;<span class="SpellE">Kapor</span>, S., and&nbsp;<span class="SpellE">Tatić</span>, B.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1989).</span>
</span>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;<span class="GramE">Fatty Acid Composition of Seeds of the&nbsp;<span class="SpellE">Papaveraceae</span>&nbsp;and&nbsp;<span class="SpellE">Fumariaceae</span>.</span>&nbsp;<span class="SpellE">Phytochemistry</span>
<b>28,&nbsp;</b>133-137.&nbsp;&nbsp;&nbsp;&nbsp;<b>10.1016/0031-9422(89)85024-1</b>
<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Fatty acids were&nbsp;<span class="SpellE">analysed</span>&nbsp;in the seeds of 40 species from 12 genera of the&nbsp;<span class="SpellE">Papaveraceae</span>&nbsp;and 14 species from four genera of the<span class="SpellE">Fumariaceae</span>.&nbsp;<span class="SpellE">Linoleate</span>&nbsp;was predominant in both families; however, its content was 11% greater on average in the&nbsp;<span class="SpellE">Papaveraceae</span>. With<span class="SpellE">Papaver</span>&nbsp;<span class="SpellE">orientale</span>&nbsp;and Corydalis cava intraspecific variability of fatty acid patterns of seed lipids was studied; no large differences between samples were encountered.&nbsp;<span class="SpellE">Triacylglycerols</span>&nbsp;were the dominant lipid class. Members of&nbsp;<span class="SpellE">Papaveraceae</span>&nbsp;show a higher triacylglycerol but lower free fatty acid content than members of&nbsp;<span class="SpellE">Fumariaceae</span>.<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span class="GramE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Marin, P.D.,&nbsp;<span class="SpellE">Sajdl</span>, V.,&nbsp;<span class="SpellE">Kapor</span>, S.,&nbsp;<span class="SpellE">Tatic</span>, B., and&nbsp;<span class="SpellE">Petkovic</span>, B.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1991).</span>
</span>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;<span class="GramE">Fatty Acids of the&nbsp;<span class="SpellE">Saturejoideae</span>,&nbsp;<span class="SpellE">Ajugoideae</span>&nbsp;and&nbsp;<span class="SpellE">Scutellarioideae</span>(<span class="SpellE">Lamiaceae</span>).</span>&nbsp;<span class="SpellE">
<span class="GramE">Phytochemistry</span>
</span>
<span class="GramE">&nbsp;<b>30,&nbsp;</b>2979-2982.</span>&nbsp;&nbsp;&nbsp;&nbsp;<b>10.1016/S0031-9422(00)98235-9</b>
<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Fatty acid composition of&nbsp;<span class="SpellE">nutlet</span>&nbsp;lipids in 62 species from the&nbsp;<span class="SpellE">Saturejoideae</span>, seven species from the&nbsp;<span class="SpellE">Ajugoideae</span>&nbsp;and four species from the&nbsp;<span class="SpellE">Scutellarioideae</span>&nbsp;have been&nbsp;<span class="SpellE">analysed</span>.&nbsp;<span class="SpellE">Linolenate</span>&nbsp;was the predominant acid in all species from the&nbsp;<span class="SpellE">Saturejoideae</span>&nbsp;but in the&nbsp;<span class="SpellE">Ajugoideae</span>,<span class="SpellE">linoleate</span>&nbsp;and&nbsp;<span class="SpellE">linolenate</span>&nbsp;were the major fatty acids. In the&nbsp;<span class="SpellE">Scutellarioideae</span>,&nbsp;<span class="SpellE">linoleate</span>&nbsp;was the dominant fatty acid. Results showed that the fatty acid composition of&nbsp;<span class="SpellE">nutlet</span>&nbsp;lipids and their&nbsp;<span class="SpellE">linolenate</span>/<span class="SpellE">linoleate</span>&nbsp;ratios may be useful as taxonomic markers for the differentiation of genera belonging to different subfamilies of the&nbsp;<span class="SpellE">Lamiaceae</span>.<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span class="SpellE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Matthaus</span>
</b>
</span>
<b>
<span style="font-size: 11pt; font-family: Helvetica;">, B.,&nbsp;<span class="SpellE">Vosmann</span>, K., Pham, L.Q., and&nbsp;<span class="SpellE">Aitzetmuller</span>, K.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(2003).&nbsp;<span class="SpellE">
<span class="GramE">Fa</span>
</span>
<span class="GramE">&nbsp;and&nbsp;<span class="SpellE">Tocopherol</span>&nbsp;Composition of Vietnamese Oilseeds.</span>&nbsp;Journal of the American Oil Chemists Society&nbsp;<b>80,&nbsp;</b>1013-1020.&nbsp;&nbsp;&nbsp;&nbsp;<b>10.1007/s11746-003-0813-y</b>
<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seeds of 40 oilseed species from 23 different plant families (Brassicaceae,&nbsp;<span class="SpellE">Cucurbitaceae</span>,&nbsp;<span class="SpellE">Fabaceae</span>,&nbsp;<span class="SpellE">Sapindaceae</span>,&nbsp;<span class="SpellE">Malvaceae</span>,<span class="SpellE">Gnetaceae</span>,&nbsp;<span class="SpellE">Clusiaceae</span>,&nbsp;<span class="SpellE">Bruseraceae</span>,&nbsp;<span class="SpellE">Ranunculaceae</span>,&nbsp;<span class="SpellE">Convolvulaceae</span>,&nbsp;<span class="SpellE">Amaranthaceae</span>,&nbsp;<span class="SpellE">Tiliaceae</span>,&nbsp;<span class="SpellE">Basellaceae</span>,&nbsp;<span class="SpellE">Solanaceae</span>,<span class="SpellE">Umbelliferae</span>,&nbsp;<span class="SpellE">Labiatae</span>,&nbsp;<span class="SpellE">Compositae</span>,&nbsp;<span class="SpellE">Theaceae</span>,&nbsp;<span class="SpellE">Euphorbiaceae</span>,&nbsp;<span class="SpellE">Caesalpiniaceae</span>,&nbsp;<span class="SpellE">Sapotaceae</span>,&nbsp;<span class="SpellE">Anacardiaceae</span>, and&nbsp;<span class="SpellE">Connaraceae</span>) grown in Vietnam were analyzed for oilseed oil content, FA, and vitamin E. The seed oil content varied between 0.2 g/100 g for&nbsp;<span class="SpellE">Mangifera</span>&nbsp;<span class="SpellE">indica</span>and 75.7 g/100 g for&nbsp;<span class="SpellE">Calophyllum</span>&nbsp;<span class="SpellE">inophyllum</span>, whereas only nine seeds contained more than 40% oil. The&nbsp;<span class="SpellE">tocopherol</span>&nbsp;content ranged from 26 (<span class="SpellE">Sapindus</span>&nbsp;<span class="SpellE">mukorossi</span>) to 9361 mg/kg (Litchi&nbsp;<span class="SpellE">chinensis</span>). In nine seed oils unusual FA such as conjugated,&nbsp;<span class="SpellE">cyclopropenoic</span>, or epoxy FA were found.<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span class="SpellE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Mawlong</span>
</b>
</span>
<b>
<span style="font-size: 11pt; font-family: Helvetica;">, I.,&nbsp;<span class="SpellE">Sujith</span>&nbsp;Kumar, M.S., and Singh, D.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(2014). Furan Fatty Acids: Their Role in Plant Systems.&nbsp;<span class="SpellE">Phytochemistry</span>&nbsp;Reviews&nbsp;<b>15,&nbsp;</b>121-127.&nbsp;&nbsp;&nbsp;&nbsp;<b>10.1007/s11101-014-9388-7</b>
<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span class="SpellE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Mikolajczak</span>
</b>
</span>
<b>
<span style="font-size: 11pt; font-family: Helvetica;">, K.L., Miwa, T.K., Earle, F.R., Wolff, I.A., and Jones, Q.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1961). Search for New Industrial Oils. V. Oils of&nbsp;<span class="SpellE">Cruciferae</span>. Journal of the American Oil Chemists Society&nbsp;<b>38,&nbsp;</b>678-681.&nbsp;&nbsp;&nbsp;&nbsp;<b>10.1007/BF02633053</b>
<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seeds from 37 species of plants in the family&nbsp;<span class="SpellE">Cruciferae</span>&nbsp;were analyzed for oil and protein, and the fatty acid composition of the oils was determined by gas-liquid chromatography.&nbsp;<span class="SpellE">Erucic</span>&nbsp;acid, generally considered characteristic of crucifer oils, occurs in about three-fourths of these species in amounts ranging from 3 to 59%. Some oils free of&nbsp;<span class="SpellE">erucic</span>&nbsp;acid contain up to 63%&nbsp;<span class="SpellE">linolenic</span>&nbsp;acid or up to 58%&nbsp;<span class="SpellE">eicosenoic</span>.<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Miller, R.W., Earle, F.R., Wolff, I.A., and Barclay, A.S.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1968). Search for New Seed Oils. Xv. Oils of&nbsp;<span class="SpellE">Boraginaceae</span>. Lipids&nbsp;<b>3,&nbsp;</b>43-45.&nbsp;&nbsp;&nbsp;<b>10.1007/BF02530967</b>
<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;In a search for a preferred source of γ-<span class="SpellE">linolenic</span>&nbsp;(all-cis-6<span class="GramE">,9,12</span>-octadecatrienoic) acid, seed oils of 33 species of&nbsp;<span class="SpellE">Boraginaceae</span>&nbsp;were examined. The desired&nbsp;<span class="SpellE">triene</span>&nbsp;was found primarily in the subfamily&nbsp;<span class="SpellE">Boraginoideae</span>&nbsp;in amounts ranging from 0.2 to 18%. Oils of this subfamily also contain 0.2 to 15% of the&nbsp;<span class="SpellE">tetraene</span>, all-cis-6<span class="GramE">,9,12,15</span>-octadecatetraenoic acid. Total unsaturation and the relative proportions of the common acids varied widely in oils of the family.&nbsp;<span class="SpellE">Monoene</span>&nbsp;predominated in the subfamily&nbsp;<span class="SpellE">Cordioideae</span>,&nbsp;<span class="SpellE">diene</span>&nbsp;in&nbsp;<span class="SpellE">Heliotropioideae</span>, and a diverse composition among the&nbsp;<span class="SpellE">Boraginoideae</span>; seven had iodine values of 200 or above.&nbsp;<span class="SpellE">Cordia</span>&nbsp;<span class="SpellE">verbenacea</span>&nbsp;seed oil was unique among those examined in having 43% of C 20 acids and 23% of components more volatile in gas chromatography than the usual triglycerides.<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Miller, R.W., Earle, F.R., Wolff, I.A., and Jones, Q.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1965). Search for New Industrial Oils. Xiii. Oils from 102 Species of&nbsp;<span class="SpellE">Cruciferae</span>. Journal of the American Oil Chemists' Society&nbsp;<b>42,&nbsp;</b>817-821.&nbsp;&nbsp;&nbsp;&nbsp;<b>10.1007/BF02541165</b>
<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Seed from additional species of&nbsp;<span class="SpellE">Cruciferae</span>&nbsp;have been analyzed for crude protein, oil and fatty acids in the oil. Oils were like those reported earlier from other crucifers, except for&nbsp;<span class="SpellE">Cardamine</span>&nbsp;impatiens which is unique among known seed oils because it contains some 25%&nbsp;<span class="SpellE">dihydroxy</span>&nbsp;acids.&nbsp;<span class="SpellE">Erucic</span>&nbsp;acid is present (0.3-55%) in about three-fourths of the 102 samples.&nbsp;<span class="SpellE">Eicosenoic</span>&nbsp;acid is a major constituent (32-53%) in four species and&nbsp;<span class="SpellE">monohydroxy</span>&nbsp;acids (45-72%) in another four.&nbsp;<span class="SpellE">Linolenic</span>&nbsp;acid occurs (2-66%) in oil of all species.<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span class="GramE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Miller, R.W., Gentry, H.S.,&nbsp;<span class="SpellE">Daxenbichler</span>, M.E., and Earle, F.R.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1964).</span>
</span>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;Search for New Industrial Oils .8. Genus&nbsp;<span class="SpellE">Limnanthes</span>. Journal of the American Oil Chemists Society&nbsp;<b>41,&nbsp;</b>167-&amp;.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span class="SpellE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Miralles</span>
</b>
</span>
<b>
<span style="font-size: 11pt; font-family: Helvetica;">, J., and Pares, Y.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1980).&nbsp;<span class="GramE">Fatty-Acid Composition of Some Oils from Senegalese Seeds.</span>&nbsp;Revue&nbsp;<span class="SpellE">Francaise</span>&nbsp;Des Corps Gras&nbsp;<b>27,&nbsp;</b>393-396.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span class="SpellE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Morice</span>
</b>
</span>
<b>
<span style="font-size: 11pt; font-family: Helvetica;">, I.M.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1967).&nbsp;<span class="GramE">Seed Fats of&nbsp;<span class="SpellE">Astelia</span>&nbsp;and&nbsp;<span class="SpellE">Collospermum</span>&nbsp;Family&nbsp;<span class="SpellE">Liliaceae</span>.</span>&nbsp;Journal of the Science of Food and Agriculture&nbsp;<b>18,&nbsp;</b>343-&amp;.&nbsp;&nbsp;&nbsp;<b>10.1002/jsfa.2740180804</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Mukherjee, K.D.,&nbsp;<span class="SpellE">Kiewitt</span>, I., and&nbsp;<span class="SpellE">Hurka</span>, H.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1984).&nbsp;<span class="GramE">Lipid-Content and Fatty-Acid Composition of Seeds of&nbsp;<span class="SpellE">Capsella</span>&nbsp;Species from Different Geographical Locations.</span>&nbsp;<span class="SpellE">Phytochemistry</span>&nbsp;<b>23,&nbsp;</b>117-119.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span class="SpellE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Muuse</span>
</b>
</span>
<b>
<span style="font-size: 11pt; font-family: Helvetica;">, B.G.,&nbsp;<span class="SpellE">Essers</span>, M.L., and&nbsp;<span class="SpellE">Vansoest</span>, L.J.M.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1988).&nbsp;<span class="SpellE">Oenothera</span>&nbsp;Species and&nbsp;<span class="SpellE">Borago-Officinalis</span>&nbsp;- Sources of Gamma-<span class="SpellE">Linolenic</span>&nbsp;Acid. Netherlands Journal of Agricultural Science&nbsp;<b>36,&nbsp;</b>357-363.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span class="SpellE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Ngiefu</span>
</b>
</span>
<b>
<span style="font-size: 11pt; font-family: Helvetica;">, C.K.,&nbsp;<span class="SpellE">Paquot</span>, C., and Vieux, A.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1977).&nbsp;<span class="GramE">Oil-Bearing Plants of Zaire.</span>&nbsp;Iii. Botanical Families Providing Oils of Relatively High Unsaturation.&nbsp;<span class="SpellE">Oleagineux</span>&nbsp;<b>32,&nbsp;</b>535-537.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">Data are tabulated on the seed oil&nbsp;<span class="SpellE">compostion</span>&nbsp;of 16 spp. of&nbsp;<span class="SpellE">Leguminosae</span>&nbsp;(including&nbsp;<span class="SpellE">Albizia</span>&nbsp;<span class="SpellE">lebbeck</span>,&nbsp;<span class="SpellE">Caesalpinia</span>&nbsp;<span class="SpellE">pulcherrima</span>, and<span class="SpellE">Delonix</span>&nbsp;<span class="SpellE">regia</span>), 6 spp. of&nbsp;<span class="SpellE">Euphorbiaceae</span>&nbsp;(including&nbsp;<span class="SpellE">Aleurites</span>&nbsp;<span class="SpellE">moluccana</span>,&nbsp;<span class="SpellE">Hevea</span>&nbsp;<span class="SpellE">brasiliensis</span>&nbsp;and&nbsp;<span class="SpellE">Jatropha</span>&nbsp;<span class="SpellE">curcas</span>) and 1 sp. (<span class="SpellE">Kigelia</span>
<span class="SpellE">africana</span>) of&nbsp;<span class="SpellE">Bignoniaceae</span>. The most interesting for food and industrial purposes appear to be&nbsp;<span class="SpellE">Afzelia</span>&nbsp;<span class="SpellE">bella</span>,&nbsp;<span class="SpellE">Adenanthera</span>&nbsp;<span class="SpellE">pavonina</span>&nbsp;and<span class="SpellE">Pentaclethra</span>&nbsp;<span class="SpellE">macrophylla</span>, in addition to A.&nbsp;<span class="SpellE">moluccana</span>&nbsp;and H.&nbsp;<span class="SpellE">brasiliensis</span>. (For part II, see&nbsp;<span class="SpellE">HcA</span>&nbsp;47, 9822.)<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span class="SpellE">
<span class="GramE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Özcan</span>
</b>
</span>
</span>
<span class="GramE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">, T.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(2007).</span>
</span>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;Characterization of Turkish&nbsp;<span class="SpellE">Quercus</span>&nbsp;L. Taxa Based on Fatty Acid Compositions of the Acorns. JAOCS, Journal of the American Oil Chemists' Society&nbsp;<b>84,&nbsp;</b>653-662.&nbsp;&nbsp;&nbsp;&nbsp;<b>10.1007/s11746-007-1087-8</b>
<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Total oil content and the composition of fatty acids were analyzed in the acorns of 16&nbsp;<span class="SpellE">Quercus</span>&nbsp;taxa from Turkey. The range of total fat varied between 0.7 and 7.4%. Oleic (10.2-54.4%), linoleic (24.2-49.1%),&nbsp;<span class="SpellE">palmitic</span>&nbsp;(13.4-30.4%), alpha&nbsp;<span class="SpellE">linolenic</span>&nbsp;(1.5-8.6%) and stearic acid (1.5-4.5%) were major fatty acids for all taxa. Significantly differences at section level were found (p &lt; 0.05) for&nbsp;<span class="SpellE">palmitic</span>, stearic and oleic acid concentration. Saturated (17.0-38.6%), mono unsaturated (11.0-55.5%) and unsaturated fatty acids (57.4-81.6%) in total oil were also significantly different between section&nbsp;<span class="SpellE">Quercus</span>,&nbsp;<span class="SpellE">Cerris</span>&nbsp;and Ilex (p &lt; 0.05). In addition, sectional differences were significant (p &lt; 0.02) for the relative concentrations of saturated fatty acids compared to mono, poly and total unsaturated fatty acids. Considerable variation of individual fatty acid levels were observed in related species and varieties. The species from section Ilex Loudon exhibited the highest levels of saturated fatty acid while the lowest levels were found in Q.&nbsp;<span class="SpellE">brantii</span>, Q.&nbsp;<span class="SpellE">libani</span>&nbsp;and Q.&nbsp;<span class="SpellE">trojana</span>&nbsp;from section&nbsp;<span class="SpellE">Cerris</span>&nbsp;Loudon. These species also had the highest levels of unsaturated fatty acids. Whereas the lowest values were detected in the species of section Ilex. Both varieties of Q.&nbsp;<span class="SpellE">cerris</span>&nbsp;showed significant differences (p &lt; 0.05) from the other species in section&nbsp;<span class="SpellE">Cerris</span>&nbsp;for all parameters, except for stearic acid and exhibited little variations among their individual populations. Different concentrations of fatty acids may be useful biochemical markers for the characterization of&nbsp;<span class="SpellE">Quercus</span>&nbsp;at the&nbsp;<span class="SpellE">infrageneric</span>&nbsp;level. Interesting ratios of linoleic<span class="GramE">:α</span>-<span class="SpellE">linolenic</span>&nbsp;acid especially in Q.&nbsp;<span class="SpellE">robur</span>&nbsp;ssp.&nbsp;<span class="SpellE">robur</span>, Q.<span class="SpellE">hartwissiana</span>, Q.&nbsp;<span class="SpellE">vulcanica</span>, Q.&nbsp;<span class="SpellE">ithaburensis</span>&nbsp;ssp.&nbsp;<span class="SpellE">macrolepis</span>&nbsp;and Q.&nbsp;<span class="SpellE">libani</span>&nbsp;also were detected with respect to dietary reference for fatty acid intake.<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span class="SpellE">
<span class="GramE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Pina</span>
</b>
</span>
</span>
<span class="GramE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">, M.,&nbsp;<span class="SpellE">Graille</span>, J.,&nbsp;<span class="SpellE">Grignac</span>, P., Lacombe, A.,&nbsp;<span class="SpellE">Quenot</span>, O., and&nbsp;<span class="SpellE">Garnier</span>, P.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1984).</span>
</span>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;<span class="GramE">Research on&nbsp;<span class="SpellE">Oenothera</span>&nbsp;Rich in Gamma-<span class="SpellE">Linolenic</span>&nbsp;Acid.</span>
<span class="SpellE">Oleagineux</span>&nbsp;<b>39,&nbsp;</b>593-596.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span class="SpellE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Ralaimanarivo</span>
</b>
</span>
<b>
<span style="font-size: 11pt; font-family: Helvetica;">, A.,&nbsp;<span class="SpellE">Gaydou</span>, E.M., and&nbsp;<span class="SpellE">Bianchini</span>, J.P.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1982).&nbsp;<span class="GramE">Fatty Acid Composition of Seed Oils from Six&nbsp;<span class="SpellE">Adansonia</span>&nbsp;Species with Particular Reference to&nbsp;<span class="SpellE">Cyclopropane</span>&nbsp;and&nbsp;<span class="SpellE">Cyclopropene</span>&nbsp;Acids.</span>&nbsp;Lipids&nbsp;<b>17,&nbsp;</b>1-10.&nbsp;&nbsp;&nbsp;&nbsp;<b>10.1007/BF02535115</b>
<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="GramE">The oil content of six&nbsp;<span class="SpellE">Adansonia</span>&nbsp;species (<span class="SpellE">Bombacaceae</span>&nbsp;family) of Madagascar (<span class="SpellE">Adansonia</span>&nbsp;<span class="SpellE">grandidieri</span>, A.&nbsp;<span class="SpellE">za</span>, A.&nbsp;<span class="SpellE">digitata</span>, A.&nbsp;<span class="SpellE">fony</span>, A.<span class="SpellE">madagascariensis</span>&nbsp;and A.&nbsp;<span class="SpellE">suarenzensis</span>) and Africa (A.&nbsp;<span class="SpellE">digitata</span>) ranges from 8 to 46%.</span>&nbsp;All the oils give a positive response to the&nbsp;<span class="SpellE">Halphen</span>test.&nbsp;<span class="SpellE">Malvalic</span>,&nbsp;<span class="SpellE">sterculic</span>&nbsp;and&nbsp;<span class="SpellE">dihydrosterculic</span>&nbsp;acids were detected using gas liquid chromatography-mass spectrometry (GLC-MS). Epoxy or hydroxy fatty acids were not found in these oils. Fatty acid composition was determined by GLC using glass capillary columns coated with BDS and&nbsp;<span class="SpellE">Carbowax</span>&nbsp;20 M. Results obtained for&nbsp;<span class="SpellE">cyclopropenic</span>&nbsp;fatty acids (CPEFA) were compared to those given by glass capillary GLC after&nbsp;<span class="SpellE">derivatization</span>&nbsp;with silver nitrate in methanol, by hydrogen bromide titration and by proton magnetic resonance (PMR). Good agreement was observed for the results given by the various methods.&nbsp;<span class="SpellE">Malvalic</span>&nbsp;acid content ranges from 3 to 28%,&nbsp;<span class="SpellE">sterculic</span>&nbsp;acid from 1 to 8% and<span class="SpellE">dihydrosterculic</span>&nbsp;acid from 1.5 to 5.1%. Odd-numbered fatty acids (<span class="SpellE">Pentadecanoic</span>&nbsp;and&nbsp;<span class="SpellE">hepatadecanoic</span>) were also observed in minute amounts (0.1-1.1%). Among the normal fatty acids, we observed mainly&nbsp;<span class="SpellE">palmitic</span>&nbsp;(21-46%), oleic (15-40%) and linoleic (12-32%). The relationship between fatty acid composition and&nbsp;<span class="SpellE">Adansonia</span>&nbsp;species is discussed.<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Sanchez, M.A., and&nbsp;<span class="SpellE">Cattaneo</span>, P.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1987).&nbsp;<span class="GramE">On the Contents and Fatty-Acid Composition Values of Total Lipids (<span class="SpellE">Folch</span>) from Non&nbsp;<span class="SpellE">Gily</span>&nbsp;Pulps of Edible Fruits.</span>&nbsp;<span class="SpellE">Anales</span>&nbsp;De La&nbsp;<span class="SpellE">Asociacion</span>&nbsp;<span class="SpellE">Quimica</span>&nbsp;Argentina&nbsp;<b>75,&nbsp;</b>531-549.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span class="SpellE">
<span class="GramE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Sayanova</span>
</b>
</span>
</span>
<span class="GramE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">, O., Napier, J.A., and&nbsp;<span class="SpellE">Shewry</span>, P.R.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1999).</span>
</span>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;<span class="GramE">Δ6-Unsaturated Fatty Acids in Species and Tissues of the&nbsp;<span class="SpellE">Primulaceae</span>.</span>
<span class="SpellE">Phytochemistry</span>&nbsp;<b>52,&nbsp;</b>419-422.&nbsp;&nbsp;&nbsp;&nbsp;<b>10.1016/S0031-9422(99)00256-3</b>
<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The Δ6-unsaturated fatty acids γ-<span class="SpellE">linolenic</span>&nbsp;acid (GLA; 18:3Δ6<span class="GramE">,9,12</span>) and&nbsp;<span class="SpellE">octadecatetraenoic</span>&nbsp;acid (OTA; 18:4Δ6,9,12,15) were present in seed lipids of the tribe&nbsp;<span class="SpellE">Primuleae</span>, but not in other tribes of the&nbsp;<span class="SpellE">Primulaceae</span>. Within the genus&nbsp;<span class="SpellE">Primula</span>&nbsp;both fatty acids were present in seed lipids from 22 species (from 12 sections), with combined levels increasing from 1.1 to 27.4%. High levels of Δ6- unsaturated fatty acids were also present in leaves of ten species (from nine sections), but with lower levels generally being present in root lipids. In general, the levels of&nbsp;<span class="SpellE">octadecatetraenoic</span>&nbsp;acid were higher than that of γ-&nbsp;<span class="SpellE">linolenic</span>&nbsp;acid. The results indicate that Δ6-unsaturated fatty acids could be used as taxonomic markers within the genus&nbsp;<span class="SpellE">Primula</span>.<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span class="SpellE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Seher</span>
</b>
</span>
<b>
<span style="font-size: 11pt; font-family: Helvetica;">, A., and&nbsp;<span class="SpellE">Gundlach</span>, U.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1982). Isomeric&nbsp;<span class="SpellE">Monoenoic</span>&nbsp;Acids in&nbsp;<span class="GramE">Vegetable-Oils</span>.&nbsp;<span class="SpellE">Fette</span>&nbsp;<span class="SpellE">Seifen</span>&nbsp;<span class="SpellE">Anstrichmittel</span>&nbsp;<b>84,&nbsp;</b>342-349.&nbsp;&nbsp;&nbsp;<b>10.1002/lipi.19820840904</b>
<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span class="GramE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Takagi, T., and Itabashi, Y.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1982).</span>
</span>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;<span class="GramE">Cis-5-Olefinic Unusual Fatty Acids in Seed Lipids of&nbsp;<span class="SpellE">Gymnospermae</span>&nbsp;and Their Distribution in<span class="SpellE">Triacylglycerols</span>.</span>&nbsp;Lipids&nbsp;<b>17,&nbsp;</b>716-723.&nbsp;&nbsp;&nbsp;&nbsp;<b>10.1007/BF02534657</b>
<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Open-tubular gas chromatographic analysis of fatty acids in the lipids from the seeds of 20 species of&nbsp;<span class="SpellE">Gymnospermae</span>&nbsp;showed that they all contained&nbsp;<span class="SpellE">nonmethylene</span>-interrupted&nbsp;<span class="SpellE">polyenoic</span>&nbsp;(NMIP) acids as minor components and&nbsp;<span class="SpellE">palmitic</span>, oleic, linoleic and α-<span class="SpellE">linolenic</span>&nbsp;acids as major components. The NMIP acids have an additional 5,6-ethylenic bond in ordinary plant unsaturated fatty acids and the following C2 elongation acids:cis-5, cis-9-octadecadienoic acid (5,9-18:2) (I); 5,9,12-18:3 (II); 5,9,12,15-18:4, 5,11-20:2, 5,11,14-20:3 (III); and 5,11,14,17-20:4 (IV). The main NMIP acids found in neutral lipids are I in two species of&nbsp;<span class="SpellE">Taxus</span>, II in seven species of&nbsp;<span class="SpellE">Pinaceae</span>, III in two species of&nbsp;<span class="SpellE">Podocarpaceae</span>,&nbsp;<span class="SpellE">Torreya</span>&nbsp;<span class="SpellE">nucifera</span>,&nbsp;<span class="SpellE">Cycas</span>&nbsp;<span class="SpellE">revoluta</span>, and Ginkgo&nbsp;<span class="SpellE">biloba</span>, and III and IV in each of three species of&nbsp;<span class="SpellE">Taxodiaceae</span>, and&nbsp;<span class="SpellE">Cupressaceae</span>. The polar lipids constitute the minor fraction of seed lipids in general.&nbsp;<span class="GramE">The content and composition of NMIP acids in these lipids&nbsp;<span class="SpellE">differe</span>&nbsp;considerably from those in neutral lipids.</span>&nbsp;Analysis of the partial cleavage products of&nbsp;<span class="SpellE">triacylglycerols</span>&nbsp;showed that the NMIP acids distribute mainly in the 1,3-position.<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span class="SpellE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Ucciani</span>
</b>
</span>
<b>
<span style="font-size: 11pt; font-family: Helvetica;">, E.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1995). Nouveau&nbsp;<span class="SpellE">Dictionnaire</span>&nbsp;Des&nbsp;<span class="SpellE">Huiles</span>&nbsp;<span class="SpellE">
<span class="GramE">Végétales</span>
</span>
<span class="GramE">&nbsp;:</span>&nbsp;Compositions En&nbsp;<span class="SpellE">Acides</span>&nbsp;Gras. (Paris;&nbsp;<span class="SpellE">Londres</span>; New York: Tec&nbsp;<span class="GramE">et</span>&nbsp;doc).<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Velasco, L., and&nbsp;<span class="SpellE">Goffman</span>, F.D.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1999).&nbsp;<span class="GramE">Chemotaxonomic Significance of Fatty Acids and&nbsp;<span class="SpellE">Tocopherols</span>&nbsp;in&nbsp;<span class="SpellE">Boraginaceae</span>.</span>&nbsp;<span class="SpellE">Phytochemistry</span>&nbsp;<b>52,</b>423-426.&nbsp;&nbsp;&nbsp;&nbsp;<b>10.1016/S0031-9422(99)00203-4</b>
<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A collection of 45 accessions (36 species, 20 genera) of the family&nbsp;<span class="SpellE">Boraginaceae</span>&nbsp;was evaluated for oil content, fatty acid composition,<span class="SpellE">tocopherol</span>&nbsp;content and composition. All the accessions contained γ-<span class="SpellE">linolenic</span>&nbsp;acid, the lowest content (0.7%) being found in&nbsp;<span class="SpellE">Cerinthe</span>&nbsp;major L. and the highest (24.4%) in&nbsp;<span class="SpellE">Borago</span>&nbsp;<span class="SpellE">officinalis</span>&nbsp;L. Three&nbsp;<span class="SpellE">tocopherol</span>&nbsp;profiles were characterized by the extremes of more than 90% of α-, δ- and γ-<span class="SpellE">tocopherol</span>, respectively. Fatty acids and&nbsp;<span class="SpellE">tocopherols</span>&nbsp;were suggested to have potential chemotaxonomic value in this family.<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Vickery, J.R.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1971). The Fatty Acid Composition of the Seed Oils of&nbsp;<span class="SpellE">Proteaceae</span>: A Chemotaxonomic Study.&nbsp;<span class="SpellE">Phytochemistry</span>&nbsp;<b>10,&nbsp;</b>123-130.&nbsp;&nbsp;&nbsp;<b>10.1016/S0031-9422(00)90259-0</b>
<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The fatty acid composition and the amounts of the positional isomers of the&nbsp;<span class="SpellE">monoene</span>&nbsp;acids have been determined in 26&nbsp;<span class="SpellE">Proteaceae</span>sp. representing two sub families and seven tribes. Fatty acids containing from 12 to 24 carbon atoms were detected, the major components being&nbsp;<span class="SpellE">monoene</span>&nbsp;acids. The amounts of&nbsp;<span class="SpellE">cis-hexadecenoic</span>&nbsp;acid exceeded 10% in 13 species. Each of the four&nbsp;<span class="SpellE">monoenes</span>studied had several positional isomers of which Δ9 and Δ11 predominated in&nbsp;<span class="SpellE">hexadecenoic</span>&nbsp;acid, Δ9 in&nbsp;<span class="SpellE">octadecenoic</span>&nbsp;acid and Δ11 and Δ15 in&nbsp;<span class="SpellE">eicosenoic</span>&nbsp;acid. The regression of the concentration of cis-hexadec-9-enoic acid on that of cis-octadec-11-enoic in 14 species was not statistically significant. The two sub families,&nbsp;<span class="SpellE">Grevilleoideae</span>&nbsp;and&nbsp;<span class="SpellE">Proteoideae</span>, have several distinct differences, the former, for instance, having a much wider range of acids. Differences between tribes were reflected mainly in the differing patterns of the&nbsp;<span class="SpellE">monoene</span>&nbsp;and&nbsp;<span class="SpellE">diene</span>acids, whereas these patterns were rather uniform within genera. The data for&nbsp;<span class="SpellE">Placospermum</span>&nbsp;and&nbsp;<span class="SpellE">Bellendena</span>&nbsp;tend to support the claim that the former represents the primitive form of the&nbsp;<span class="SpellE">Proteaceae</span>.<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Vickery, J.R.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1980).&nbsp;<span class="GramE">The Fatty Acid Composition of Seed Oils from Ten Plant Families with Particular Reference to&nbsp;<span class="SpellE">Cyclopropene</span>&nbsp;and<span class="SpellE">Dihydrosterculic</span>&nbsp;Acids.</span>&nbsp;Journal of the American Oil Chemists' Society&nbsp;<b>57,&nbsp;</b>87-91.&nbsp;&nbsp;&nbsp;&nbsp;<b>10.1007/BF02674370</b>
<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Oil contents and fatty acid compositions of 40 seed oils of the plant families&nbsp;<span class="SpellE">Elaecarpaceae</span>,&nbsp;<span class="SpellE">Thymelaeceae</span>,&nbsp;<span class="SpellE">Malvaceae</span>,<span class="SpellE">Sterculiaceae</span>&nbsp;(order&nbsp;<span class="SpellE">Malvales</span>);&nbsp;<span class="SpellE">Anacardiaceae</span>,&nbsp;<span class="SpellE">Celestraceae</span>,&nbsp;<span class="SpellE">Sapindaceae</span>&nbsp;(<span class="SpellE">Sapindales</span>);&nbsp;<span class="SpellE">Ebenaceae</span>,&nbsp;<span class="SpellE">Sapotaceae</span>&nbsp;(<span class="SpellE">Ebenales</span>) and<span class="SpellE">Rhamnaceae</span>&nbsp;(<span class="SpellE">Rhamnales</span>) are presented.&nbsp;<span class="SpellE">Cyclopropene</span>&nbsp;fatty acids (CPFA) occur in two families in the order&nbsp;<span class="SpellE">malvales</span>&nbsp;not hitherto assayed. CPFA contents of seed oils of 12 Australian and Pacific species of&nbsp;<span class="SpellE">Malvaceae</span>&nbsp;and&nbsp;<span class="SpellE">Sterculiaceae</span>&nbsp;are given. CPFA occur randomly in small amounts in at least six families not in the order&nbsp;<span class="SpellE">Malvales</span>.&nbsp;<span class="SpellE">Dehydrosterculic</span>&nbsp;acid (DHS) occurs in small amounts in many species of<span class="SpellE">Anacardiaceae</span>,&nbsp;<span class="SpellE">Celestraceae</span>,&nbsp;<span class="SpellE">Elaeocarpaceae</span>,&nbsp;<span class="SpellE">Malvaceae</span>,&nbsp;<span class="SpellE">Sapindaceae</span>,&nbsp;<span class="SpellE">Sapotaceae</span>&nbsp;and&nbsp;<span class="SpellE">Sterculiaceae</span>. Linoleic acid was predominant in 28 of 40 seed oils, being as high as 63.9% in two species. The sum of 18:1 and 18:2 esters exceeded 70% in 20 oils.<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span class="SpellE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Vioque</span>
</b>
</span>
<b>
<span style="font-size: 11pt; font-family: Helvetica;">, J., Pastor, J.E., and&nbsp;<span class="SpellE">Vioque</span>, E.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1994).&nbsp;<span class="GramE">Study of the Fatty-Acid Composition of the Seed Oils of Some Wild Plants in Spain.</span>&nbsp;<span class="SpellE">Grasas</span>&nbsp;Y<span class="SpellE">Aceites</span>&nbsp;<b>45,&nbsp;</b>161-163.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">The fatty acid composition of 34 species of plants from a variety of families that grow wild in the Iberian Peninsula was&nbsp;<span class="SpellE">analysed</span>. The aim to the survey was to&nbsp;<span class="SpellE">indentify</span>&nbsp;oils that contain a mix of fatty acids that from a qualitative or quantitative point of view have a commercial value. Because of the diverse taxonomic origin of the samples, the oil content between species was very variable, fluctuating between an average value of 3.4% in the&nbsp;<span class="SpellE">Caryphyllaceae</span>&nbsp;and 31.1% in&nbsp;<span class="SpellE">Euphorbiaceae</span>. Like the oil content, the fatty acid composition was quite variable, but, in general, the main fatty acids were&nbsp;<span class="SpellE">palmitic</span>, oleic, linoleic and&nbsp;<span class="SpellE">linolenic</span>&nbsp;acid, while in the Brassicaceae and in the&nbsp;<span class="SpellE">Apiaceae</span>
<span class="SpellE">erucic</span>&nbsp;acid and&nbsp;<span class="SpellE">petroselinic</span>&nbsp;acid were the principal fatty acids respectively.<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Wang, J<span class="GramE">.-</span>P.,&nbsp;<span class="SpellE">Meng</span>, S.-J., Zhang, Q.-H., and He, G.-F.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1981).&nbsp;<span class="GramE">The Fatty Acid Compositions of Seed Oils and Their Significance in the Taxonomy of the Family&nbsp;<span class="SpellE">Ulmaceae</span>.</span>&nbsp;<span class="SpellE">Acta</span>&nbsp;<span class="SpellE">Phytotaxonomica</span>&nbsp;<span class="SpellE">Sinica</span>&nbsp;<b>19,&nbsp;</b>416-420.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;22 kinds of seed oils were extracted from 8 genera of the family&nbsp;<span class="SpellE">Ulmaceae</span>&nbsp;in China<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The seed oils were examined for their characteristics and fatty acid compositions by gas liquid chromatography.&nbsp;&nbsp;The fatty acid compositions of these oils were found&nbsp;<span class="SpellE">tofall</span>&nbsp;into two classes. Some genera (such&nbsp;<span class="GramE">as&nbsp;&nbsp;<span class="SpellE">Ulmus</span>
</span>,&nbsp;&nbsp;<span class="SpellE">Zelkova</span>)&nbsp;&nbsp;contain&nbsp;&nbsp;mainly<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="GramE">lower</span>&nbsp;saturated acids, in which the chief acid is&nbsp;<span class="SpellE">capric</span>&nbsp;acid 10:0, while the genera<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(<span class="GramE">such</span>&nbsp;as&nbsp;<span class="SpellE">Celtis</span>,&nbsp;<span class="SpellE">Pteroceltis</span>,&nbsp;<span class="SpellE">Aphananthe</span>,&nbsp;<span class="SpellE">Trema</span>,&nbsp;<span class="SpellE">Gironniera</span>) contain mainly&nbsp;<span class="SpellE">unsaturat</span>-<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="SpellE">
<span class="GramE">ed</span>
</span>&nbsp;acids, in which the chief acid is linoleic acid&nbsp;&nbsp;18:2.&nbsp;&nbsp;<span class="SpellE">
<span class="GramE">Hemiptelea</span>
</span>
<span class="GramE">&nbsp;&nbsp;<span class="SpellE">davidii</span>
</span>&nbsp;&nbsp;(<span class="SpellE">Hance</span>)<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Planch contain however either certain amount of short-chain saturated acids or higher<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="GramE">unsaturated</span>&nbsp;acids, it appears a intermediate genus between the two classes.&nbsp;&nbsp;According<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="GramE">to</span>&nbsp;the component acids we support that the&nbsp;<span class="SpellE">Ulmaceae</span>&nbsp;be split into two subfamilies.<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The genera arrangement based on the component acids corresponds basically with the<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="GramE">view</span>&nbsp;based on&nbsp;<span class="SpellE">mophological</span>&nbsp;characters and flavonoids found in leaves of&nbsp;<span class="SpellE">Ulmaceae</span>, but<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="GramE">there</span>&nbsp;are some discrepancies in certain genera, for example, the&nbsp;<span class="SpellE">Aphananthe</span>&nbsp;should be<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="GramE">placed</span>&nbsp;in&nbsp;<span class="SpellE">Celtoid</span>&nbsp;instead of&nbsp;<span class="SpellE">Ulmoid</span>&nbsp;by the present study.<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span class="SpellE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Wissebach</span>
</b>
</span>
<b>
<span style="font-size: 11pt; font-family: Helvetica;">, H.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1969).&nbsp;<span class="SpellE">
<span class="GramE">Fette</span>
</span>
<span class="GramE">&nbsp;Und&nbsp;<span class="SpellE">Lipoide</span>&nbsp;(Lipids).</span>&nbsp;(Berlin, Heidelberg: Springer Berlin Heidelberg).<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Wolf, R.B.,&nbsp;<span class="SpellE">Kleiman</span>, R., and England, R.E.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1983).&nbsp;<span class="GramE">New Sources of Γ-<span class="SpellE">Linolenic</span>&nbsp;Acid.</span>&nbsp;Journal of the American Oil Chemists' Society&nbsp;<b>60,</b>1858-1860.&nbsp;&nbsp;&nbsp;&nbsp;<b>10.1007/BF02901538</b>
<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;γ-<span class="SpellE">Linolenic</span>&nbsp;acid (18:3Δ6<span class="GramE">,9,12</span>) occurs in significant amounts in various species of plants surveyed. Of the species analyzed in this study,&nbsp;<span class="SpellE">Nonnea</span>&nbsp;<span class="SpellE">macrospernia</span>, with 5.1% 7-linolenic acid in the seed, is the richest source of this fatty acid. Other species in the same family (<span class="SpellE">Boraginaceae</span>) are also good sources:&nbsp;<span class="SpellE">Adelocaryum</span>&nbsp;<span class="SpellE">coelestinum</span>,&nbsp;<span class="SpellE">Alkanna</span>&nbsp;<span class="SpellE">froedinii</span>,&nbsp;<span class="SpellE">Alkanna</span>&nbsp;<span class="SpellE">orientalis</span>&nbsp;and&nbsp;<span class="SpellE">Brunnera</span>&nbsp;<span class="SpellE">orientalis</span>.<span class="SpellE">Scrophularia</span>&nbsp;<span class="SpellE">marilandica</span>&nbsp;(family&nbsp;<span class="SpellE">Scrophulariaceae</span>) seeds contain 37.9% oil, of which 9.6% is γ-<span class="SpellE">linolenic</span>&nbsp;acid. All species mentioned above are better sources, when the total amount of γ-<span class="SpellE">linolenic</span>&nbsp;acid in the seed is considered, than that used traditionally, Evening Primrose (<span class="SpellE">Oenothera</span>&nbsp;<span class="SpellE">biennis</span>, family&nbsp;<span class="SpellE">Onagraceae</span>). None of the other&nbsp;<span class="SpellE">Onagraceae</span>&nbsp;nor any of the&nbsp;<span class="SpellE">Ribes</span>&nbsp;(family&nbsp;<span class="SpellE">Saxifragaceae</span>) species analyzed&nbsp;<span class="GramE">are</span>as rich in γ-<span class="SpellE">linolenic</span>&nbsp;acid as Evening Primrose.&nbsp;<span class="SpellE">Octadecatetraenoic</span>&nbsp;acid (18:4Δ<span class="GramE">,6,9,12,15</span>) was found in significant amounts in most of the<span class="SpellE">Boraginaceae</span>&nbsp;and&nbsp;<span class="SpellE">Ribes</span>&nbsp;surveyed. The&nbsp;<span class="SpellE">Onagraceae</span>&nbsp;and&nbsp;<span class="SpellE">Scrophulariaceae</span>&nbsp;lack detectable amounts of this fatty acid.<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Wolff, R.L.,&nbsp;<span class="SpellE">Deluc</span>, L.G., and&nbsp;<span class="SpellE">Marpeau</span>, A.M.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1996). Conifer Seeds: Oil Content and Fatty Acid Composition. Journal of the American Oil Chemists Society&nbsp;<b>73,&nbsp;</b>765-771.&nbsp;&nbsp;&nbsp;&nbsp;<b>10.1007/bf02517953</b>
<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The seed oils from twenty-five Conifer species (from four families-<span class="SpellE">Pinaceae</span>,&nbsp;<span class="SpellE">Cupressaceae</span>,&nbsp;<span class="SpellE">Taxodiaceae</span>, and&nbsp;<span class="SpellE">Taxaceae</span>) have been analyzed, and their fatty acid compositions were established by capillary gas-liquid chromatography on two columns with different polarities. The oil content of the seeds varied from less than 1% up to 50%. Conifer seed oils were characterized by the presence of several Delta 5-unsaturated&nbsp;<span class="SpellE">polymethylene</span>-interrupted polyunsaturated fatty acids (Delta 5-acids) with either 18 (cis-5, cis-9 18:2, cis-5, cis-9, cis-12 18:3, and cis-5, cis-9, cis-12, cis-15 18:4 acids) or 20 carbon atoms (cis-5, cis-11 20:2, cis-5, cis-11, cis-14 20:3, and cis-5, cis-11, cis-14, cis-17 20:4 acids).&nbsp;<span class="SpellE">Pinaceae</span>&nbsp;seed oils contained 17-31% of Delta 5-acids, mainly with 18 carbon atoms. The 20-carbon acids present were structurally derived from 20:1n-9 and 20:2n-6 acids.&nbsp;<span class="SpellE">Pinaceae</span>&nbsp;seed oils were practically devoid of 18:3n-3 acid and did not contain either Delta 5-18:4 or Delta 5-20:4 acids. Several&nbsp;<span class="SpellE">Pinaceae</span>&nbsp;seeds had a Delta 5-acid content higher than 50 mg/g of seed. The only&nbsp;<span class="SpellE">Taxaceae</span>seed oil studied (<span class="SpellE">Taxus</span>&nbsp;<span class="SpellE">baccata</span>) had a fatty acid composition related to those of&nbsp;<span class="SpellE">Pinaceae</span>&nbsp;seed oils.&nbsp;<span class="SpellE">Cupressaceae</span>&nbsp;seed oils differed from<span class="SpellE">Pinaceae</span>&nbsp;seed oils by the absence of Delta 5-acids with 18 carbon atoms and high concentrations in 18:3n-3 acid and in Delta 5-acids with 20 carbon atoms (Delta 5-20:3 and Delta 5-20:4 acids). Delta 5-18:4 Acid was present in minute amounts. The highest level of Delta 5-20:4<span class="GramE">acid</span>&nbsp;was found in&nbsp;<span class="SpellE">Juniperus</span>&nbsp;<span class="SpellE">communis</span>&nbsp;seed oil, but the best source of Delta 5-acids among&nbsp;<span class="SpellE">Cupressaceae</span>&nbsp;was&nbsp;<span class="SpellE">Thuja</span>&nbsp;<span class="SpellE">occidentalis</span>.<span class="SpellE">Taxodiaceae</span>&nbsp;seed oils had more heterogeneous fatty acid compositions, but the distribution of Delta 5-acids resembled that found in<span class="SpellE">Cupressaceae</span>&nbsp;seed oils. Except for&nbsp;<span class="SpellE">Sciadopytis</span>&nbsp;<span class="SpellE">verticillata</span>, other&nbsp;<span class="SpellE">Taxodiaceae</span>&nbsp;species are not interesting sources of Delta 5-acids. The distribution profile of Delta 5-acids among different Conifer families appeared to be linked to the occurrence of 18:3n-3 acid in the seed oils.<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Wolff, R.L.,&nbsp;<span class="SpellE">Deluc</span>, L.G.,&nbsp;<span class="SpellE">Marpeau</span>, A.M., and Comps, B.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(1997). Chemotaxonomic Differentiation of Conifer Families and Genera Based on the Seed Oil Fatty Acid Compositions: Multivariate Analyses. Trees - Structure and Function&nbsp;<b>12,&nbsp;</b>57-65.&nbsp;&nbsp;&nbsp;&nbsp;<b>10.1007/s004680050122</b>
<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;The fatty acid compositions of seed oils from 34 conifer species, mainly&nbsp;<span class="SpellE">Pinaceae</span>&nbsp;and secondarily&nbsp;<span class="SpellE">Cupressaceae</span>, have been determined by gas-liquid chromatography of the methyl esters. As noted in earlier studies, these oils were characterized by the presence of several Δ5-olefinic acids, i.e., 5,9-18:2, 5,9,12-18:3, 5,9,12,15-18:4, 5,11-20:2, 5,11,14-20:3, and 5,11,14,17-20:4 acids, in addition to the more common saturated, oleic, linoleic and α-<span class="SpellE">linolenic</span>&nbsp;acids. Based on these fatty acid compositions, and on those established in earlier systematic studies (<span class="SpellE">totalling</span>&nbsp;82 species), we established a chemotaxonomic grouping of the main conifer families, i.e., of the&nbsp;<span class="SpellE">Pinaceae</span>,<span class="SpellE">Taxodiaceae</span>,&nbsp;<span class="SpellE">Cupressaceae</span>, and&nbsp;<span class="SpellE">Taxaceae</span>. This was achieved using multivariate analyses (principal component analysis and discriminant analysis). The fatty acids that discriminate best in this classification are the 5,11,14,17-20:4, 9,12,15-18:3 and 5,9,12-18:3 acids. Moreover, it was possible to differentiate between several genera of the&nbsp;<span class="SpellE">Pinaceae</span>:&nbsp;<span class="SpellE">Pinus</span>&nbsp;(including&nbsp;<span class="SpellE">Tsuga</span>&nbsp;and&nbsp;<span class="SpellE">Pseudotsuga</span>),&nbsp;<span class="SpellE">Abies</span>,&nbsp;<span class="SpellE">Cedrus</span>, and<span class="SpellE">Picea</span>&nbsp;plus&nbsp;<span class="SpellE">Larix</span>, represented quite distinct groups. Other fatty acids such as oleic, linoleic, and 5,9-18:2 acids were also important for this purpose. The fatty acid compositions, and particularly the Δ5-olefinic acid contents of conifer seed oils, may thus be applied to the<span class="SpellE">chemosystematic</span>&nbsp;distinction among conifer families as well as genera of the&nbsp;<span class="SpellE">Pinaceae</span>.<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span class="GramE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Wolff, R.L.,&nbsp;<span class="SpellE">Lavialle</span>, O.,&nbsp;<span class="SpellE">Pedrono</span>, F.,&nbsp;<span class="SpellE">Pasquier</span>, E.,&nbsp;<span class="SpellE">Deluc</span>, L.G.,&nbsp;<span class="SpellE">Marpeau</span>, A.M., and&nbsp;<span class="SpellE">Aitzetmuller</span>, K.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(2001).</span>
</span>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;<span class="GramE">Fatty Acid Composition of<span class="SpellE">Pinaceae</span>&nbsp;as Taxonomic Markers.</span>&nbsp;Lipids&nbsp;<b>36,&nbsp;</b>439-451.&nbsp;&nbsp;&nbsp;&nbsp;<b>10.1007/s11745-001-0741-5</b>
<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
<span style="font-family: Helvetica;">Following our previous review on&nbsp;<span class="SpellE">Pinus</span>&nbsp;spp. seed fatty acid (FA) compositions, we recapitulate here the seed FA compositions of&nbsp;<span class="SpellE">Larix</span>&nbsp;(larch),<span class="SpellE">Picea</span>&nbsp;(spruce), and&nbsp;<span class="SpellE">Pseudotsuga</span>&nbsp;(Douglas&nbsp;<span class="SpellE">iir</span>) spp. Numerous seed FA compositions not described earlier are included. Approximately 40% of all&nbsp;<span class="SpellE">Picea</span>taxa and one-third of&nbsp;<span class="SpellE">Larix</span>&nbsp;taxa have been analyzed so Car for their seed FA compositions. Qualitatively, the seed FA compositions in the three genera studied here are the same as in&nbsp;<span class="SpellE">Pinus</span>&nbsp;spp., including in particular the same Delta5-olefinic acids. However, they display a considerably lower variability in<span class="SpellE">Larix</span>&nbsp;and&nbsp;<span class="SpellE">Picea</span>&nbsp;spp. than in&nbsp;<span class="SpellE">Pinus</span>&nbsp;spp. An assessment of geographical Variations in the seed FA composition of P.&nbsp;<span class="SpellE">abies</span>&nbsp;was made, and intraspecific dissimilarities in this species were found to be of considerably smaller amplitude than interspecific dissimilarities among other&nbsp;<span class="SpellE">Picea</span>&nbsp;species. This observation supports the use of seed FA compositions as chemotaxonomic markers, as they practically do not depend on edaphic or climatic conditions. This also shows that&nbsp;<span class="SpellE">Picea</span>&nbsp;spp.&nbsp;<span class="GramE">are</span>&nbsp;coherently united as a group by their seed FA compositions. This also holds for&nbsp;<span class="SpellE">Larix</span>&nbsp;spp. Despite a close resemblance between&nbsp;<span class="SpellE">Picea</span>&nbsp;and&nbsp;<span class="SpellE">Larix</span>&nbsp;spp. seed FA compositions, principal component analysis indicates that the minor differences in seed FA compositions between the two genera are sufficient to allow a clear-cut individualization of the two genera.&nbsp;<span class="GramE">in</span>&nbsp;both cases, the main FA is linoleic acid (slightly less than one-half of total FA), followed by&nbsp;<span class="SpellE">pinolenic</span>&nbsp;(5,9,12-18:3) and oleic acids. A maximum of 34% of total Delta5-olefinic acids is reached in L.&nbsp;<span class="SpellE">sibirica</span>&nbsp;seeds, which appears to be the highest value found in&nbsp;<span class="SpellE">Pinaceae</span>&nbsp;seed FA. This apparent limit is discussed in terms of&nbsp;<span class="SpellE">regio</span>- and stereospecific distribution of Delta5-olefinic acids in seed&nbsp;<span class="SpellE">triacylglycerols</span>. Regarding the single species of&nbsp;<span class="SpellE">Pseudotsuga</span>&nbsp;analyzed so far (P.&nbsp;<span class="SpellE">menziesii</span>) its seed FA composition is quite distinct from that of the other two genera, and in particular, it contains 1.2%&nbsp;<span class="GramE">of 14-methylhexadecanoic (anteiso-17:0) acid</span>. In the three genera studied here, as well as in most&nbsp;<span class="SpellE">Pinus</span>&nbsp;spp., the C-18 Delta5-olefinic acids (5,9-18:2 and 5,9,12-18:3 acids) are present in considerably higher amounts than the C-20 Delta5-olefinic acids (5,11-20:2 and 5,11,14-20:3 acids).<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span class="GramE">
<b>
<span style="font-size: 11pt; font-family: Helvetica;">Wolff, R.L.,&nbsp;<span class="SpellE">Pedrono</span>, F.,&nbsp;<span class="SpellE">Pasquier</span>, E., and&nbsp;<span class="SpellE">Marpeau</span>, A.M.</span>
</b>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;(2000).</span>
</span>
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;<span class="GramE">General Characteristics of&nbsp;<span class="SpellE">Pinus</span>&nbsp;Spp. Seed Fatty Acid Compositions, and Importance of Delta 5-Olefinic Acids in the Taxonomy and Phylogeny of the Genus.</span>&nbsp;Lipids&nbsp;<b>35,&nbsp;</b>1-22.&nbsp;&nbsp;&nbsp;&nbsp;<b>10.1007/s11745-000-0489-y</b>
<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin: 0in 0in 3pt 22.5pt; font-size: 10pt; font-family: &quot;Times New Roman&quot;; line-height: normal; text-align: justify; text-indent: -0.2in;">
<span style="font-size: 11pt; font-family: Helvetica;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
<span style="font-family: Helvetica;">The Delta 5-unsaturated&nbsp;<span class="SpellE">polymethylene</span>-interrupted fatty acid (Delta 5-UPIFA) contents and profiles of gymnosperm seeds are useful&nbsp;<span class="SpellE">chemometric</span>data for the taxonomy and phylogeny of that division, and these acids may also have some biomedical or nutritional applications. We recapitulate here all data available on pine (<span class="SpellE">Pinus</span>; the largest genus in the family&nbsp;<span class="SpellE">Pinaceae</span>) seed fatty acid (SFA) compositions, including 28 unpublished compositions. This overview encompasses 76 species, subspecies, and varieties, which is approximately one-half of all extant pines officially recognized at these taxon levels; Qualitatively, the SFA from all pine species analyzed so far are identical. The genus&nbsp;<span class="SpellE">Pinus</span>&nbsp;is coherently united-but this qualitative feature can be extended to the whole family&nbsp;<span class="SpellE">Pinaceae</span>-by the presence of Delta 5-UPIFA with C-18 [<span class="SpellE">taxoleic</span>&nbsp;(5,9-18:2) and&nbsp;<span class="SpellE">pinolenic</span>&nbsp;(5,9,12-18:3) acids] and C-20 chains [5,11-20.2, and&nbsp;<span class="SpellE">sciadonic</span>&nbsp;15,11,14-20:3) acids]. Not a single pine species was found so far with any of these acids missing. Linoleic acid is almost always, except in a few cases, the prominent SFA, in the range 40-60% of total fatty acids. The second habitual SFA is oleic acid, from 12 to 30%. Exceptions, however, occur, particularly in the&nbsp;<span class="SpellE">Cembroides</span>&nbsp;subsection, where oleic acid reaches ca. 45%, a value higher than that of linoleic acid.&nbsp;<span class="GramE">alpha</span>-<span class="SpellE">Linolenic</span>&nbsp;acid, on the other hand, is a minor constituent of pine SFA, almost always less than 1%, but that would reach 2.7% in one species (P.&nbsp;<span class="SpellE">merkusii</span>). The sum of saturated acids [16:0 (major) and 18:0 (minor) acids principally] is most often less than 10% of total SFA, and anteiso-17:0 acid is present in all species&nbsp;<span class="SpellE">in<span class="GramE">:amounts</span>
</span>&nbsp;up to 0.3%. Regarding C18 Delta 5-UPIFA,&nbsp;<span class="SpellE">taxoleic</span>&nbsp;acid reaches a maximum of 4.5% of total SFA, whereas&nbsp;<span class="SpellE">pinolenic</span>&nbsp;acid varies from 0.1 to 25.3%. The very minor&nbsp;<span class="SpellE">coniferonic</span>&nbsp;(5,9,12,15-18:4) acid is less than 0.2% in all species. The C20 elongation product of&nbsp;<span class="SpellE">pinolenic</span>&nbsp;acid,<span class="SpellE">bishomo-pinolenic</span>&nbsp;(7,11,14-20:3) acid, is a frequent though minor SFA constituent (maximum, 0.7%). When considering C20 Delta 5-UPIFA, a difference is noted between the subgenera&nbsp;<span class="SpellE">Strobus</span>&nbsp;and&nbsp;<span class="SpellE">Pinus</span>. In the former subgenus, 5,11-20:2 and&nbsp;<span class="SpellE">sciadonic</span>&nbsp;acids are less than or equal to 0.3 and less than or equal to 1.9%, respectively, whereas in the latter subgenus, they are most often greater than or equal to 0.3 and greater than or equal to 2.0%, respectively. The highest values for 5,11-20:2 and&nbsp;<span class="SpellE">sciadonic</span>&nbsp;acids are 0.5% (many species) and 7.0% (P.&nbsp;<span class="SpellE">pinaster</span>). The 5,11,14,17-20:<span class="GramE">4 (<span class="SpellE">juniperonic</span>) acid</span>is present occasionally in trace amounts. The highest level of total Delta 5-UPIFA is 30-31% (P.&nbsp;<span class="SpellE">sylvestris</span>), and the lowest level is 0.6% (P.&nbsp;<span class="SpellE">monophylla</span>). Uniting as well as discriminating features that may complement the knowledge about the taxonomy and phylogeny of pines are emphasized.</span>
</p>

HTML
)




Page.create!(title: 'Origin_Names', description: 'How do plant fatty acids get their common names?', content: <<-HTML
<h1>Where do plant fatty acid common names come from?</h1>
<p>
</p>
<p class="p1">What is the origin of plant fatty acid names?&nbsp; We searched and found that most of the usual and unusual fatty acids found in plants have common names that originate from the plant where they were first discovered or described.&nbsp; However, there are some interesting exceptions highlighted in bold below.</p>
<p class="p1">
</p>
<table border="0" cellpadding="0" cellspacing="0" width="980" style="width: 980pt;">
<!--StartFragment-->
 <colgroup>
<col width="146" style="mso-width-source:userset;mso-width-alt:6229;width:146pt">
 <col width="180" style="mso-width-source:userset;mso-width-alt:7680;width:180pt">
 <col width="297" style="mso-width-source:userset;mso-width-alt:12672;width:297pt">
 <col width="357" style="mso-width-source:userset;mso-width-alt:15232;width:357pt">
 </colgroup>
<tbody>
<tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl80" width="146" style="height:22.0pt;width:146pt">
<b>Common/Trivial
  Name</b>
</td>
  <td class="xl80" width="180" style="width:180pt">
<b>Shorthand notation</b>
</td>
  <td class="xl81" width="297" style="width:297pt">
<b>Systematic Name</b>
</td>
  <td class="xl80" width="357" style="width:357pt">
<b>Origin of Common Name</b>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl67" style="height:22.0pt">Acetic acid</td>
  <td class="xl67">&nbsp;2:0</td>
  <td class="xl68" width="297" style="width:297pt">Acetic acid</td>
  <td class="xl69">
<b>Derived from acetum, the Latin word for vinegar, and is
  related to the word acid&nbsp;</b>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl70" style="height:22.0pt">Agonandric acid</td>
  <td class="xl70">&nbsp;8-OH-18:2Δ9a,11t</td>
  <td class="xl71" width="297" style="width:297pt">11-Octadecen-9-ynoic acid,
  8-hydroxy-, (11E)-</td>
  <td class="xl72">Named after the genus <font class="font6">Agonandra</font>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl70" style="height:22.0pt">Alvaradoic acid</td>
  <td class="xl70">&nbsp;18:2Δ6a,17</td>
  <td class="xl71" width="297" style="width:297pt">17-Octadecen-6-ynoic acid</td>
  <td class="xl72">Named after the genus <font class="font6">Alvaradoa</font>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl67" style="height:22.0pt">Argemonic acid</td>
  <td class="xl67">&nbsp;6-OH-6-Me-9=O-28:0</td>
  <td class="xl68" width="297" style="width:297pt">Octacosanoic acid,
  6-hydroxy-6-methyl-9-oxo-</td>
  <td class="xl72">Named after the genus <font class="font6">Argemone</font>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl67" style="height:22.0pt">Auricolic acid</td>
  <td class="xl67">&nbsp;14-OH-20:2Δ11c,17c</td>
  <td class="xl68" width="297" style="width:297pt">11,17-Eicosadienoic acid,
  14-hydroxy-, (11Z,14R,17Z)-</td>
  <td class="xl72">Named after the species <font class="font6">Lesquerella
  auriculata</font>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl67" style="height:22.0pt">Behenic acid</td>
  <td class="xl67">&nbsp;22:0</td>
  <td class="xl68" width="297" style="width:297pt">Docosanoic acid</td>
  <td class="xl72">Named after&nbsp;Ben oil&nbsp;(or behen oil), extracted from
  the seeds of the&nbsp;Ben-oil tree (<font class="font6">Moringa oleifera</font>
<font class="font5">).</font>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl73" style="height:22.0pt">Butyric acid</td>
  <td class="xl73" style="border-left:none">&nbsp;4:0</td>
  <td class="xl74" width="297" style="border-left:none;width:297pt">Butanoic acid</td>
  <td class="xl75" style="border-left:none">
<b>Derived from Greek, meaning
  "butter"</b>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl73" style="height:22.0pt;border-top:none">Calendic acid</td>
  <td class="xl73" style="border-top:none;border-left:none">&nbsp;18:3Δ8t,10t,12t</td>
  <td class="xl74" width="297" style="border-top:none;border-left:none;width:297pt">8,10,12-Octadecatrienoic
  acid, (8E,10E,12E)-</td>
  <td class="xl75" style="border-top:none;border-left:none">Named after the genus
  <font class="font6">Calendula</font>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl67" style="height:22.0pt">Capric acid</td>
  <td class="xl67">&nbsp;10:0</td>
  <td class="xl68" width="297" style="width:297pt">Decanoic acid</td>
  <td class="xl69">
<b>Derived from the Latin "caper / capra" (goat)
  because&nbsp; smell is reminiscent of goats</b>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl67" style="height:22.0pt">Caproic acid</td>
  <td class="xl67">&nbsp;6:0</td>
  <td class="xl68" width="297" style="width:297pt">Hexanoic acid</td>
  <td class="xl69">
<b>Derived from the Latin "caper / capra" (goat)
  because&nbsp; smell is reminiscent of goats</b>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl73" style="height:22.0pt">Caprylic acid</td>
  <td class="xl73" style="border-left:none">&nbsp;8:0</td>
  <td class="xl74" width="297" style="border-left:none;width:297pt">Octanoic acid</td>
  <td class="xl69">
<b>Derived from the Latin "caper / capra" (goat)
  because&nbsp; smell is reminiscent of goats</b>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl67" style="height:22.0pt">Catalpic acid</td>
  <td class="xl67">&nbsp;18:3Δ9t,11t,13c</td>
  <td class="xl68" width="297" style="width:297pt">9,11,13-Octadecatrienoic acid,
  (9E,11E,13Z)-</td>
  <td class="xl72">Named after <font class="font6">Catalpa ovata</font>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl67" style="height:22.0pt">Chaulmoogric acid</td>
  <td class="xl67">&nbsp;18:1cy</td>
  <td class="xl68" width="297" style="width:297pt">2-Cyclopentene-1-tridecanoic
  acid, (1S)-</td>
  <td class="xl72">Named after chaulmoogra seeds (Hydnocarpus wightiana)</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl67" style="height:22.0pt">Colnelenic acid</td>
  <td class="xl67">
</td>
  <td class="xl68" width="297" style="width:297pt">(E)-9-[(1E,3Z,6Z)-nona-1,3,6-trienoxy]non-8-enoic
  acid</td>
  <td class="xl69">
<b>Named after Colney Lane in Norwich, England, the location of
  Terry Galliard lab where it was discovered</b>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl73" style="height:22.0pt">Coniferonic acid</td>
  <td class="xl73" style="border-left:none">&nbsp;18:4Δ5c,9c,12c,15c</td>
  <td class="xl74" width="297" style="border-left:none;width:297pt">5,9,12,15-Octadecatetraenoic
  acid, (5Z,9Z,12Z,15Z)-</td>
  <td class="xl73" style="border-left:none">Named after conifer trees</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl67" style="height:22.0pt">Coronaric acid</td>
  <td class="xl67">&nbsp;9,10-O-18:1Δ12c</td>
  <td class="xl68" width="297" style="width:297pt">2-Oxiraneoctanoic acid,
  3-(2Z)-2-octen-1-yl-, (2R,3S)-</td>
  <td class="xl72">Named after the species <font class="font6">Chrysanthemum
  coronarium</font>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl67" style="height:22.0pt">Columbinic acid</td>
  <td class="xl67">&nbsp;18:3Δ5t,9c,12c</td>
  <td class="xl68" width="297" style="width:297pt">7,9,12-Octadecatrienoic acid,
  (E,Z,Z)-</td>
  <td class="xl72">Named after the columbine plant</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl67" style="height:22.0pt">Crepenynic acid</td>
  <td class="xl67">&nbsp;18:2Δ9c,12a</td>
  <td class="xl68" width="297" style="width:297pt">9-Octadecen-12-ynoic acid, (9Z)-</td>
  <td class="xl72">Named after the genus <font class="font6">Crepis</font>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl76" style="height:22.0pt">Dehydrocrepenynic acid</td>
  <td class="xl76" style="border-left:none">&nbsp;18:3Δ9c,12c,14a</td>
  <td class="xl77" width="297" style="border-left:none;width:297pt">9,​14-​Octadecadien-​12-​ynoic
  acid, (9Z,​14Z)​-</td>
  <td class="xl72">Named after the genus<font class="font6"> Crepis</font>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl67" style="height:22.0pt">Densipolic acid</td>
  <td class="xl67">&nbsp;12-OH-18:2Δ9c,15c</td>
  <td class="xl68" width="297" style="width:297pt">9,15-Octadecadienoic acid,
  12-hydroxy-, methyl ester, (Z,Z)-</td>
  <td class="xl72">Named after the species<font class="font6"> Lesquerella
  densipila</font>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl76" style="height:22.0pt">Dihomopinolenic acid</td>
  <td class="xl76" style="border-left:none">&nbsp;20:3Δ7c,11c,14c</td>
  <td class="xl77" width="297" style="border-left:none;width:297pt">7,11,14-Eicosatrienoic
  acid, (7Z,11Z,14Z)-</td>
  <td class="xl72">Named after the genus <font class="font6">Pinus</font>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl70" style="height:22.0pt">Dihydromalvalic acid</td>
  <td class="xl70">&nbsp;8,9-cpa-18:0</td>
  <td class="xl71" width="297" style="width:297pt">Cyclopropaneheptanoic acid,
  2-octyl-</td>
  <td class="xl70">Named for the genus <font class="font6">Malva</font>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl73" style="height:22.0pt">Dimorphecolic acid</td>
  <td class="xl73" style="border-left:none">&nbsp;9-OH-18:2Δ10t,12t</td>
  <td class="xl74" width="297" style="border-left:none;width:297pt">10,​12-​Octadecadienoic
  acid, 9-​hydroxy-</td>
  <td class="xl75" style="border-left:none">Named after the genus <font class="font6">Dimorphotheca</font>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl76" style="height:22.0pt;border-top:none">Eranthic acid</td>
  <td class="xl76" style="border-top:none;border-left:none">&nbsp;22:3Δ5c,13c,16c</td>
  <td class="xl77" width="297" style="border-top:none;border-left:none;width:297pt">5,13,16-Docosatrienoic
  acid, (5Z,13Z,16Z)-</td>
  <td class="xl75" style="border-top:none;border-left:none">Named after the genus
  <font class="font6">Eranthis</font>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl67" style="height:22.0pt">Erucic acid</td>
  <td class="xl67">&nbsp;22:1Δ13c</td>
  <td class="xl68" width="297" style="width:297pt">13-Docosenoic acid, (13Z)-</td>
  <td class="xl72">Named after the genus <font class="font6">Eruca</font>
<font class="font5"> in the family Brassicaceae</font>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl73" style="height:22.0pt">Formic acid</td>
  <td class="xl73" style="border-left:none">&nbsp;1:0</td>
  <td class="xl74" width="297" style="border-left:none;width:297pt">Formic acid</td>
  <td class="xl69">
<b>Derived from&nbsp;Latin&nbsp;word for ant,&nbsp;formica,
  referring to its early isolation by the&nbsp;distillation&nbsp;of ant bodies</b>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl73" style="height:22.0pt;border-top:none">Hydnocarpic
  acid</td>
  <td class="xl73" style="border-top:none;border-left:none">&nbsp;16:1cy</td>
  <td class="xl74" width="297" style="border-top:none;border-left:none;width:297pt">2-Cyclopentene-1-undecanoic
  acid, (1R)-</td>
  <td class="xl75" style="border-left:none">Named after the genus<font class="font6"> Hydnocarpus</font>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl70" style="height:22.0pt">Ixoric acid</td>
  <td class="xl70">&nbsp;18:4Δ8c,10c,12c,14t</td>
  <td class="xl71" width="297" style="width:297pt">8,10,12,14-Octadecatetraenoic
  acid, (8Z,10Z,12Z,14E)-</td>
  <td class="xl72">Named after <font class="font6">Ixora chinensis</font>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl76" style="height:22.0pt">Jacaric acid; Jacaranda acid</td>
  <td class="xl76" style="border-left:none">&nbsp;18:3Δ8c,10t,12c</td>
  <td class="xl77" width="297" style="border-left:none;width:297pt">8,10,12-Octadecatrienoic
  acid, (Z,E,Z)- (8CI)</td>
  <td class="xl75" style="border-left:none">Named after <font class="font6">Jacaranda
  mimosifolia</font>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl67" style="height:22.0pt">Juniperonic acid</td>
  <td class="xl67">&nbsp;20:4Δ5c,11c,14c,17c</td>
  <td class="xl68" width="297" style="width:297pt">5,11,14,17-Eicosatetraenoic
  acid, (5Z,11Z,14Z,17Z)-</td>
  <td class="xl72">Named after the genus<font class="font6"> Juniperus</font>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl67" style="height:22.0pt">Kamlolenic acid</td>
  <td class="xl67">&nbsp;18-OH-18:3Δ9c,11t,13t</td>
  <td class="xl68" width="297" style="width:297pt">9,11,13-Octadecatrienoic acid,
  18-hydroxy-, (9Z,11E,13E)-</td>
  <td class="xl67">Named after kamala tree (<font class="font6">Mallotus
  philippensis</font>
<font class="font5">)</font>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl76" style="height:22.0pt">Lamenallenic acid</td>
  <td class="xl76" style="border-left:none">&nbsp;18:3Δ5,6allene,16t</td>
  <td class="xl77" width="297" style="border-left:none;width:297pt">5,6,16-Octadecatrienoic
  acid</td>
  <td class="xl75" style="border-left:none">Named after the genus <font class="font6">Lamium</font>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl73" style="height:22.0pt;border-top:none">Lauric acid</td>
  <td class="xl73" style="border-top:none;border-left:none">&nbsp;12:0</td>
  <td class="xl74" width="297" style="border-top:none;border-left:none;width:297pt">Dodecanoic
  acid</td>
  <td class="xl67">Named after plants of Lauraceae family</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl73" style="height:22.0pt;border-top:none">Lesquerolic
  acid</td>
  <td class="xl73" style="border-top:none;border-left:none">&nbsp;R-14-OH-20:1Δ11c</td>
  <td class="xl74" width="297" style="border-top:none;border-left:none;width:297pt">11-Eicosenoic
  acid, 14-hydroxy-, (11Z,14R)-</td>
  <td class="xl75" style="border-left:none">Named after the genus<font class="font6"> Lesquerella</font>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl70" style="height:22.0pt">Licanic acid</td>
  <td class="xl70">&nbsp;4-O=18:3Δ9c,11t,13t</td>
  <td class="xl71" width="297" style="width:297pt">9,11,13-Octadecatrienoic acid,
  4-oxo-, (9Z,11E,13E)-</td>
  <td class="xl72">Named after the genus <font class="font6">Licania</font>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl67" style="height:22.0pt">Linderic acid</td>
  <td class="xl67">&nbsp;12:1Δ4c</td>
  <td class="xl68" width="297" style="width:297pt">4-Dodecenoic acid, (4Z)-</td>
  <td class="xl72">Named after genus <font class="font6">Lindera</font>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl67" style="height:22.0pt">Malvalic acid</td>
  <td class="xl67">&nbsp;8,9-cpe-18:1</td>
  <td class="xl68" width="297" style="width:297pt">1-Cyclopropene-1-heptanoic acid,
  2-octyl-</td>
  <td class="xl70">Named for the genus <font class="font6">Malva</font>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl73" style="height:22.0pt">Melissic acid</td>
  <td class="xl73" style="border-left:none">&nbsp;30:0</td>
  <td class="xl74" width="297" style="border-left:none;width:297pt">Triacontanoic
  acid</td>
  <td class="xl78" style="border-left:none">
<b>Derived from&nbsp; Greek word 'melissa' meaning bee; it is
  abundant in flowers which attract bees</b>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl73" style="height:22.0pt;border-top:none">Montanic acid</td>
  <td class="xl73" style="border-top:none;border-left:none">&nbsp;28:0</td>
  <td class="xl74" width="297" style="border-top:none;border-left:none;width:297pt">Octacosanoic
  acid</td>
  <td class="xl69">
<b>Derived from montan wax, extracted from brown coal</b>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl67" style="height:22.0pt">Myristic acid</td>
  <td class="xl67">&nbsp;14:0</td>
  <td class="xl68" width="297" style="width:297pt">Tetradecanoic acid</td>
  <td class="xl72">Named after the nutmeg <font class="font6">Myristica fragrans</font>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl67" style="height:22.0pt">Myristoleic acid</td>
  <td class="xl67">&nbsp;14:1Δ9c</td>
  <td class="xl68" width="297" style="width:297pt">9-Tetradecenoic acid, (9Z)-</td>
  <td class="xl72">Named after the nutmeg <font class="font6">Myristica fragrans</font>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl73" style="height:22.0pt">Obtusilic acid</td>
  <td class="xl73" style="border-left:none">&nbsp;10:1Δ4c</td>
  <td class="xl74" width="297" style="border-left:none;width:297pt">4-Decenoic
  acid, (4Z)-</td>
  <td class="xl72">Named after <font class="font6">Lindera obtusiloba</font>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl67" style="height:22.0pt">Oleic acid</td>
  <td class="xl67">&nbsp;18:1Δ9c</td>
  <td class="xl68" width="297" style="width:297pt">9-Octadecenoic acid, (9Z)-</td>
  <td class="xl72">Named after oil of olive</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl67" style="height:22.0pt">Palmitic acid</td>
  <td class="xl67">&nbsp;16:0</td>
  <td class="xl68" width="297" style="width:297pt">Hexadecanoic acid</td>
  <td class="xl72">Named after palm trees (palm oil)</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl67" style="height:22.0pt">Parinaric acid</td>
  <td class="xl67">&nbsp;18:4Δ9,11,13,15</td>
  <td class="xl68" width="297" style="width:297pt">9,11,13,15-Octadecatetraenoic
  acid</td>
  <td class="xl67">Named after the genus <font class="font6">Parinarium</font>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl67" style="height:22.0pt">Paullinic acid</td>
  <td class="xl67">&nbsp;20:1Δ13c</td>
  <td class="xl68" width="297" style="width:297pt">13-Eicosenoic acid, (13Z)-</td>
  <td class="xl72">Named after <font class="font6">Paullinia cupana</font>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl70" style="height:22.0pt">Petroselinic acid</td>
  <td class="xl70">&nbsp;18:1Δ6c</td>
  <td class="xl71" width="297" style="width:297pt">6-​Octadecenoic acid, (6Z)​-</td>
  <td class="xl72">Named after the genus <font class="font6">Petroselinum</font>
<font class="font5">, parsley</font>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl70" style="height:22.0pt">Phlomic acid</td>
  <td class="xl70">&nbsp;20:2Δ7,8allene</td>
  <td class="xl71" width="297" style="width:297pt">7,8-Eicosadienoic acid</td>
  <td class="xl72">Named after the genus <font class="font6">Phlomis</font>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl73" style="height:22.0pt">Pinolenic acid</td>
  <td class="xl73" style="border-left:none">&nbsp;18:3Δ5c,9c,12c</td>
  <td class="xl74" width="297" style="border-left:none;width:297pt">5,9,12-Octadecatrienoic
  acid, (5Z,9Z,12Z)-</td>
  <td class="xl72">Named after <font class="font6">Pinus</font>
<font class="font5">
  species</font>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl73" style="height:22.0pt;border-top:none">Podocarpic
  acid</td>
  <td class="xl73" style="border-top:none;border-left:none">&nbsp;20:3Δ5c,11c,14c</td>
  <td class="xl74" width="297" style="border-top:none;border-left:none;width:297pt">5,​11,​14-​Eicosatrienoic
  Acid, (Z,​Z,​Z)​-</td>
  <td class="xl75" style="border-left:none">Named after the genus <font class="font6">Podocarpus</font>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl67" style="height:22.0pt">Punicinic acid</td>
  <td class="xl67">&nbsp;18:3Δ9c,11t,13c</td>
  <td class="xl68" width="297" style="width:297pt">9,11,13-Octadecatrienoic acid,
  (9Z,11Z,13E)-</td>
  <td class="xl72">Named after the pomegranate, <font class="font6">Punica
  granatum</font>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl73" style="height:22.0pt">Pyrulic acid</td>
  <td class="xl73" style="border-left:none">&nbsp;17:2Δ8a,10t</td>
  <td class="xl74" width="297" style="border-left:none;width:297pt">10-Heptadecen-8-ynoic
  acid, (10E)-</td>
  <td class="xl72">Named after genus <font class="font6">Pyrularia</font>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl67" style="height:22.0pt">Ricinoleic acid</td>
  <td class="xl67">&nbsp;12-OH-18:1Δ9c</td>
  <td class="xl68" width="297" style="width:297pt">9-Octadecenoic acid,
  12-hydroxy-, (9Z,12R)-</td>
  <td class="xl72">Named after Castor plant (<font class="font6">Ricinus communis</font>
<font class="font5">)&nbsp;</font>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl73" style="height:22.0pt">Roughanic acid</td>
  <td class="xl73" style="border-left:none">&nbsp;16:3Δ7c,10c,13c</td>
  <td class="xl74" width="297" style="border-left:none;width:297pt">7,10,13-Hexadecatrienoic
  acid, (7Z,10Z,13Z)-</td>
  <td class="xl79">
<b>Named by colleagues of Grattan Roughan, a New Zealand
  biochemist instrumental in understanding its synthesis</b>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl67" style="height:22.0pt">Santalbic acid</td>
  <td class="xl67">&nbsp;18:2Δ9a,11t</td>
  <td class="xl68" width="297" style="width:297pt">11-Octadecen-9-ynoic acid,
  (11E)-</td>
  <td class="xl72">Named after<font class="font6"> ximenia</font>
<font class="font5"> species</font>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl73" style="height:22.0pt">Sapienic acid</td>
  <td class="xl73" style="border-left:none">&nbsp;16:1Δ6c</td>
  <td class="xl74" width="297" style="border-left:none;width:297pt">6-Hexadecenoic
  acid, (6Z)-</td>
  <td class="xl78" style="border-left:none">
<b>Sapienic acid is a sebum fatty acid
  unique to humans</b>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl73" style="height:22.0pt;border-top:none">Stearic acid</td>
  <td class="xl73" style="border-top:none;border-left:none">&nbsp;18:0</td>
  <td class="xl74" width="297" style="border-top:none;border-left:none;width:297pt">Octadecanoic
  acid</td>
  <td class="xl78" style="border-top:none;border-left:none">
<b>Derived from the
  Greek word "stéaros", which means solid</b>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl73" style="height:22.0pt;border-top:none">Sterculic acid</td>
  <td class="xl73" style="border-top:none;border-left:none">&nbsp;9,10-cpe-19:1</td>
  <td class="xl74" width="297" style="border-top:none;border-left:none;width:297pt">1-Cyclopropene-1-octanoic
  acid, 2-octyl-</td>
  <td class="xl72">Named after the genus <font class="font6">Sterculia</font>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl67" style="height:22.0pt">Sterculynic acid</td>
  <td class="xl67">&nbsp;8,9-cpe-19:2Δ17a</td>
  <td class="xl68" width="297" style="width:297pt">1-Cyclopropene-1-heptanoic acid,
  2-(8-nonyn-1-yl)-</td>
  <td class="xl72">Named after the genus <font class="font6">Sterculia</font>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl76" style="height:22.0pt">Strophanthus acid</td>
  <td class="xl76" style="border-left:none">&nbsp;9-OH-18:1Δ12c</td>
  <td class="xl77" width="297" style="border-left:none;width:297pt">12-Octadecenoic
  acid, 9-hydroxy-, (9S,12Z)-</td>
  <td class="xl72">Named after the genus <font class="font6">Strophanthus</font>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl73" style="height:22.0pt;border-top:none">Tariric acid</td>
  <td class="xl73" style="border-top:none;border-left:none">&nbsp;18:1Δ6a</td>
  <td class="xl74" width="297" style="border-top:none;border-left:none;width:297pt">6-Octadecynoic
  acid</td>
  <td class="xl72">Named after the glucoside of the "tariri plant"
  found in Guatemala</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl73" style="height:22.0pt;border-top:none">Taxoleic acid</td>
  <td class="xl73" style="border-top:none;border-left:none">&nbsp;18:2Δ5c,9c</td>
  <td class="xl74" width="297" style="border-top:none;border-left:none;width:297pt">5,9-Octadecadienoic
  acid, (5Z,9Z)-</td>
  <td class="xl72">Named after the genus <font class="font6">Taxus</font>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl67" style="height:22.0pt">Thalictric acid</td>
  <td class="xl67">&nbsp;18:1Δ5t</td>
  <td class="xl68" width="297" style="width:297pt">5-Octadecenoic acid, (5E)-</td>
  <td class="xl72">Named after the genus <font class="font6">Thalictrum</font>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl76" style="height:22.0pt">Vernolic acid</td>
  <td class="xl76" style="border-left:none">&nbsp;12,13-O-18:1Δ9c</td>
  <td class="xl77" width="297" style="border-left:none;width:297pt">9-​Undecenoic
  acid, 11-​[(2S,​3R)​-​3-​pentyl-​2-​oxiranyl]​-​, (9Z)​-</td>
  <td class="xl72">Named after the genus <font class="font6">Vernonia</font>
</td>
 </tr>
 <tr height="22" style="mso-height-source:userset;height:22.0pt">
  <td height="22" class="xl73" style="height:22.0pt;border-top:none">Ximenic acid</td>
  <td class="xl73" style="border-top:none;border-left:none">&nbsp;26:1Δ17c</td>
  <td class="xl74" width="297" style="border-top:none;border-left:none;width:297pt">17-Hexacosenoic
  acid, (17Z)-</td>
  <td class="xl72">Named after the genus<font class="font6"> Ximenia</font>
</td>
 </tr>
<!--EndFragment-->
</tbody>
</table>
HTML
)




Page.create!(title: 'Whats_Missing', description: 'Where can new FA structures be discovered?', content: <<-HTML
<h1 style="margin-top:0pt;margin-bottom:0pt;text-align:justify;text-justify:
inter-ideograph;direction:ltr;unicode-bidi:embed;mso-vertical-align-alt:auto">
<span style="font-size: 11pt; font-family: Calibri; font-weight: bold;">C</span>
<span style="font-size: 11pt; font-family: Calibri; font-weight: bold;">an </span>
<span style="line-height: 1.42857;">
</span>
<span style="font-size: 11pt; font-family: Calibri; font-weight: bold;">we
discover </span>
<span style="line-height: 1.42857;">
</span>
<span style="font-size: 11pt; font-family: Calibri; font-weight: bold;">new
plant&nbsp;</span>
<span style="font-size: 11pt; font-family: Calibri; font-weight: bold;">FA structures? </span>&nbsp;<span style="font-size: 11pt; font-family: Calibri; font-weight: bold;">What orders are missing FA&nbsp;</span>
<span style="font-size: 11pt; font-family: Calibri; font-weight: bold;">data?</span>
</h1>
<p style="margin-top:0pt;margin-bottom:0pt;text-align:justify;text-justify:
inter-ideograph;direction:ltr;unicode-bidi:embed;mso-vertical-align-alt:auto">
<span style="font-size:11.0pt;font-family:Calibri;mso-ascii-font-family:Calibri;
mso-fareast-font-family:&quot;ＭＳ Ｐゴシック&quot;;mso-bidi-font-family:&quot;ＭＳ Ｐゴシック&quot;;color:black;
mso-color-index:1;mso-font-kerning:12.0pt;language:en-US;mso-style-textfill-type:
solid;mso-style-textfill-fill-themecolor:text1;mso-style-textfill-fill-color:
black;mso-style-textfill-fill-alpha:100.0%">Analysis of seeds of thousands of
plant species has revealed the occurrence of hundreds of different fatty acid
structures.<span style="mso-spacerun:yes">&nbsp; </span>Are there more unique fatty
acid structures still to be discovered? Examination of all the plant species
represented in SOFA, together with recent phylogenetic information allows us to
identify branches in plant evolution whose seeds may not have been analyzed for
fatty acid composition. </span>
</p>
<p>
</p>
<p style="margin-top:0pt;margin-bottom:0pt;text-align:justify;text-justify:
inter-ideograph;direction:ltr;unicode-bidi:embed;mso-vertical-align-alt:auto">
<b>
<span style="font-size:11.0pt;font-family:Calibri;mso-ascii-font-family:Calibri;
mso-fareast-font-family:&quot;ＭＳ Ｐゴシック&quot;;mso-bidi-font-family:&quot;ＭＳ Ｐゴシック&quot;;color:black;
mso-color-index:1;mso-font-kerning:12.0pt;language:en-US;mso-style-textfill-type:
solid;mso-style-textfill-fill-themecolor:text1;mso-style-textfill-fill-color:
black;mso-style-textfill-fill-alpha:100.0%">Perhaps </span>
</b>
<span style="font-size:11.0pt;font-family:Calibri;mso-ascii-font-family:Calibri;
mso-fareast-font-family:&quot;ＭＳ Ｐゴシック&quot;;mso-bidi-font-family:&quot;ＭＳ Ｐゴシック&quot;;color:black;
mso-color-index:1;mso-font-kerning:12.0pt;language:en-US;mso-style-textfill-type:
solid;mso-style-textfill-fill-themecolor:text1;mso-style-textfill-fill-color:
black;mso-style-textfill-fill-alpha:100.0%">
<b>25% of plant orders and 50% of
plant families have not been analyzed for FA composition</b>. </span>
<span style="font-size:11.0pt;font-family:Calibri;mso-ascii-font-family:Calibri;
mso-fareast-font-family:&quot;ＭＳ Ｐゴシック&quot;;mso-bidi-font-family:&quot;ＭＳ Ｐゴシック&quot;;color:black;
mso-color-index:1;mso-font-kerning:12.0pt;language:en-US;mso-style-textfill-type:
solid;mso-style-textfill-fill-themecolor:text1;mso-style-textfill-fill-color:
black;mso-style-textfill-fill-alpha:100.0%">Therefore</span>
<span style="font-size:11.0pt;font-family:Calibri;mso-ascii-font-family:Calibri;
mso-fareast-font-family:&quot;ＭＳ Ｐゴシック&quot;;mso-bidi-font-family:&quot;ＭＳ Ｐゴシック&quot;;color:black;
mso-color-index:1;mso-font-kerning:12.0pt;language:en-US;mso-style-textfill-type:
solid;mso-style-textfill-fill-themecolor:text1;mso-style-textfill-fill-color:
black;mso-style-textfill-fill-alpha:100.0%">, many (&gt;100?) new fatty acid
structures might yet be discovered.</span>
<span style="font-size:11.0pt;
font-family:Calibri;mso-ascii-font-family:Calibri;mso-fareast-font-family:&quot;ＭＳ Ｐゴシック&quot;;
mso-bidi-font-family:&quot;ＭＳ Ｐゴシック&quot;;color:black;mso-color-index:1;mso-font-kerning:
12.0pt;language:en-US;font-weight:bold;mso-style-textfill-type:solid;
mso-style-textfill-fill-themecolor:text1;mso-style-textfill-fill-color:black;
mso-style-textfill-fill-alpha:100.0%"> </span>
<span style="font-size:11.0pt;
font-family:Calibri;mso-ascii-font-family:Calibri;mso-fareast-font-family:&quot;ＭＳ Ｐゴシック&quot;;
mso-bidi-font-family:&quot;ＭＳ Ｐゴシック&quot;;color:black;mso-color-index:1;mso-font-kerning:
12.0pt;language:en-US;font-weight:bold;mso-style-textfill-type:solid;
mso-style-textfill-fill-themecolor:text1;mso-style-textfill-fill-color:black;
mso-style-textfill-fill-alpha:100.0%">
<span style="mso-spacerun:yes">&nbsp;</span>
</span>
<span style="font-size:11.0pt;font-family:Calibri;mso-ascii-font-family:Calibri;
mso-fareast-font-family:&quot;ＭＳ Ｐゴシック&quot;;mso-bidi-font-family:&quot;ＭＳ Ｐゴシック&quot;;color:black;
mso-color-index:1;mso-font-kerning:12.0pt;language:en-US;mso-style-textfill-type:
solid;mso-style-textfill-fill-themecolor:text1;mso-style-textfill-fill-color:
black;mso-style-textfill-fill-alpha:100.0%">The table below presents
information on branches of the plant kingdom that have had little or no fatty
acid analysis.</span>
</p>
<p style="margin-top:0pt;margin-bottom:0pt;text-align:justify;text-justify:
inter-ideograph;direction:ltr;unicode-bidi:embed;mso-vertical-align-alt:auto">
<span style="font-size:11.0pt;font-family:Calibri;mso-ascii-font-family:Calibri;
mso-fareast-font-family:&quot;ＭＳ Ｐゴシック&quot;;mso-bidi-font-family:&quot;ＭＳ Ｐゴシック&quot;;color:black;
mso-color-index:1;mso-font-kerning:12.0pt;language:en-US;mso-style-textfill-type:
solid;mso-style-textfill-fill-themecolor:text1;mso-style-textfill-fill-color:
black;mso-style-textfill-fill-alpha:100.0%">
<br>
</span>
</p>
<p style="margin-top:0pt;margin-bottom:0pt;text-align:justify;text-justify:
inter-ideograph;direction:ltr;unicode-bidi:embed;mso-vertical-align-alt:auto">

</p>
<table border="0" cellpadding="0" cellspacing="0" width="731" style="width: 731pt;">
<!--StartFragment-->
 <colgroup>
<col width="96" style="mso-width-source:userset;mso-width-alt:4096;width:96pt">
 <col width="403" style="mso-width-source:userset;mso-width-alt:17194;width:403pt">
 <col width="41" span="3" style="mso-width-source:userset;mso-width-alt:1749;
 width:41pt">
 <col width="109" style="mso-width-source:userset;mso-width-alt:4650;width:109pt">
 </colgroup>
<tbody>
<tr height="60" style="height:60.0pt">
  <td height="60" class="xl70" width="96" style="height:60.0pt;width:96pt">
<b>Orders
  without FA data in PlantFAdb</b>
</td>
  <td class="xl71" width="403" style="width:403pt">
<b>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Description</b>
</td>
  <td class="xl66" width="41" style="width:41pt">
<b>Families</b>
</td>
  <td class="xl66" width="41" style="width:41pt">
<b>Genera</b>
</td>
  <td class="xl66" width="41" style="width:41pt">
<b>Species</b>
</td>
  <td class="xl68" width="109" style="width:109pt">
<b>Family names</b>
</td>
 </tr>
 <tr height="30" style="height:30.0pt">
  <td height="30" style="height:30.0pt">
<b>Amborellales</b>
</td>
  <td class="xl64" width="403" style="width:403pt">
<b>Amborella</b> trichopoda is
  only&nbsp; species.&nbsp; Molecular phylogenetic analyses
  consistently place the genus at or near the base of the flowering plant
  lineage</td>
  <td class="xl65">1</td>
  <td class="xl65">1</td>
  <td class="xl65">1</td>
  <td class="xl67" width="109" style="width:109pt">Amborellaceae</td>
 </tr>
 <tr height="30" style="height:30.0pt">
  <td height="30" style="height:30.0pt">
<b>Berberidopsidales</b>
</td>
  <td class="xl64" width="403" style="width:403pt">
<b>Berberidopsidales</b>
<font class="font5">&nbsp;is an order of&nbsp;Southern
  Hemisphere&nbsp;woody&nbsp;flowering plants.</font>
</td>
  <td class="xl65">2</td>
  <td class="xl65">3</td>
  <td class="xl65">4</td>
  <td class="xl67" width="109" style="width:109pt">Berberidopsidaceae;
  Aextoxicaceae</td>
 </tr>
 <tr height="45" style="height:45.0pt">
  <td height="45" style="height:45.0pt">
<b>Bruniales</b>
</td>
  <td class="xl64" width="403" style="width:403pt">
<b>Bruniales</b>
<font class="font5">&nbsp;at the rank of order until recently not in use,
  but a 2008 study suggested
  that&nbsp;Bruniaceae&nbsp;&amp;&nbsp;Columelliaceae&nbsp;are sister clades</font>
</td>
  <td class="xl65">2</td>
  <td class="xl65">14</td>
  <td class="xl65">79</td>
  <td class="xl67" width="109" style="width:109pt">Bruniaceae; Columelliaceae</td>
 </tr>
 <tr height="45" style="height:45.0pt">
  <td height="45" style="height:45.0pt">
<b>Canellales</b>
</td>
  <td class="xl64" width="403" style="width:403pt">
<b>Canellales</b> is one of the four orders of
  the&nbsp;magnoliids. Twofamilies:&nbsp;Canellaceae&nbsp;and Winteraceae, which comprise 136 species
  of fragrant&nbsp;trees&nbsp;and&nbsp;<font class="font6">shrubs</font>
</td>
  <td class="xl65">2</td>
  <td class="xl72">&nbsp;9-13</td>
  <td class="xl65">75-105</td>
  <td class="xl67" width="109" style="width:109pt">Canellaceae; Winteraceae</td>
 </tr>
 <tr height="45" style="height:45.0pt">
  <td height="45" style="height:45.0pt">
<b>Ceratophyllales</b>
</td>
  <td class="xl64" width="403" style="width:403pt">
<b>Hornwort</b>&nbsp;flowering
  plants, single family and genus and up to 10 species</td>
  <td class="xl65">1</td>
  <td class="xl65">1</td>
  <td class="xl65">1-2+</td>
  <td class="xl67" width="109" style="width:109pt">Ceratophyllaceae</td>
 </tr>
 <tr height="75" style="height:75.0pt">
  <td height="75" style="height:75.0pt">
<b>Commelinales</b>
</td>
  <td class="xl64" width="403" style="width:403pt">
<b>Spiderwort</b>&nbsp;and&nbsp;<font class="font6">pickerelweed</font>
<font class="font5">&nbsp;order of flowering
  plants, comprising more than 800 species of mostly tropical and
  subtropical&nbsp;</font>
<font class="font6">herbs</font>
<font class="font5">&nbsp;in
  five families:&nbsp;</font>&nbsp;</td>
  <td class="xl65">5</td>
  <td class="xl65">68</td>
  <td class="xl65">812</td>
  <td class="xl67" width="109" style="width:109pt">Commelinaceae; Pontederiaceae;
  Haemodoraceae;&nbsp;Philydraceae;&nbsp;Hanguanaceae</td>
 </tr>
 <tr height="105" style="height:105.0pt">
  <td height="105" style="height:105.0pt">
<b>Crossosomatales</b>
</td>
  <td class="xl64" width="403" style="width:403pt">
<b>Newly</b> recognized order in
  Rosids.&nbsp;&nbsp; (formerly families placed in
  Rosales, Violales, and Sapindales,)</td>
  <td class="xl65">7</td>
  <td class="xl65">12</td>
  <td class="xl65">66</td>
  <td class="xl67" width="109" style="width:109pt">Aphloiaceae; Crossosomataceae;
  Geissolomataceae; Guamatelaceae; Stachyuraceae; <font class="font5">Staphyleaceae;
  Strasburgeriaceae</font>
</td>
 </tr>
 <tr height="28" style="height:28.0pt">
  <td height="28" style="height:28.0pt">
<b>Escalloniales</b>
</td>
  <td class="xl64" width="403" style="width:403pt">
<b>Member</b> of Asterids clade</td>
  <td class="xl65">1</td>
  <td class="xl65">9</td>
  <td class="xl65">130</td>
  <td class="xl67" width="109" style="width:109pt">Escalloniaceae</td>
 </tr>
 <tr height="28" style="height:28.0pt">
  <td height="28" style="height:28.0pt">
<br>
</td>
<td class="xl64" width="403" style="width:403pt">
<br>
</td>
<td class="xl65">
<br>
</td>
<td class="xl65">
<br>
</td>
<td class="xl65">
<br>
</td>
<td class="xl67" width="109" style="width:109pt">
<br>
</td>
 </tr>
 <tr height="30" style="height:30.0pt">
  <td height="30" style="height:30.0pt">
<b>Gunnerales</b>
</td>
  <td class="xl64" width="403" style="width:403pt">
<p>
<b>Two genera:</b>&nbsp;<font class="font7">Gunnera</font>
<font class="font5">&nbsp;(in
  family&nbsp;Gunneraceae) and&nbsp;</font>
<font class="font7">Myrothamnus</font>
<font class="font5">&nbsp;(in family&nbsp;Myrothamnaceae)</font>
</p>
<p>
<font class="font5">
<br>
</font>
</p>
</td>
  <td class="xl65">2</td>
  <td class="xl65">2</td>
  <td class="xl65">42-52</td>
  <td class="xl67" width="109" style="width:109pt">Gunneraceae; Myrothamnaceae</td>
 </tr>
 <tr height="60" style="height:60.0pt">
  <td height="60" style="height:60.0pt">
<b>Huerteales</b>
</td>
  <td class="xl64" width="403" style="width:403pt">
<p>&nbsp;<b>Shrubs&nbsp;or
  small&nbsp;trees&nbsp;</b>found in most&nbsp;tropical&nbsp;or
  warm&nbsp;temperate&nbsp;regions. The flowers of&nbsp;<font class="font7">Perrottetia</font>
<font class="font5">&nbsp;have been studied in detail,</font>
<font class="font8">
<sup>[13]</sup>
</font>
<font class="font5">&nbsp; genera are poorly known.</font>
</p>
<p>
<font class="font5">
<br>
</font>
</p>
</td>
  <td class="xl65">4</td>
  <td class="xl65">6</td>
  <td class="xl65">24</td>
  <td class="xl67" width="109" style="width:109pt">Petenaeac<font class="font5">eae;&nbsp;Gerrardinaceae;&nbsp;Tapisciaceae;&nbsp;Dipentodontaceae</font>
</td>
 </tr>
 <tr height="28" style="height:28.0pt">
  <td height="28" style="height:28.0pt">
<p>
<b>
<span style="line-height: 1.42857; background-color: transparent;">Metteniusales</span>
</b>
<br>
</p>
</td>
  <td>
<p>
<b>Trees</b>,&nbsp;shrubs, and&nbsp;lianas, primarily of the&nbsp;tropics.</p>
<p>
<br>
</p>
</td>
  <td class="xl65">1</td>
  <td class="xl65">11</td>
  <td class="xl65">55</td>
  <td class="xl67" width="109" style="width:109pt">Metteniusaceae</td>
 </tr>
 <tr height="45" style="height:45.0pt">
  <td height="45" style="height:45.0pt">
<b>Paracryphiales</b>
</td>
  <td class="xl64" width="403" style="width:403pt">
<p>
<b>Woody</b> shrubs and trees
  native to&nbsp;Australia,&nbsp;southeast Asia, and&nbsp;New Caledonia.&nbsp;</p>
<p>
<br>
</p>
</td>
  <td class="xl65">1</td>
  <td class="xl65">3</td>
  <td class="xl65">36</td>
  <td class="xl67" width="109" style="width:109pt">Paracryphiaceae</td>
 </tr>
 <tr height="30" style="height:30.0pt">
  <td height="30" style="height:30.0pt">
<b>Petrosaviales</b>
</td>
  <td class="xl64" width="403" style="width:403pt">
<b>Very</b> small order of rare
  leafless achlorophyllous, mycoheterotrophic plants found in dark montane
  rainforests in Japan, China, Southeast Asia and Borneo</td>
  <td class="xl65">1</td>
  <td class="xl65">2</td>
  <td class="xl65">4</td>
  <td class="xl67" width="109" style="width:109pt">Petrosaviaceae</td>
 </tr>
 <tr height="75" style="height:75.0pt">
  <td height="75" style="height:75.0pt">
<b>Sabiales</b>
</td>
  <td class="xl64" width="403" style="width:403pt">
<p>
<br>
</p>
<p>
<b>A single family
</b>  (Sabiaceae), which is considered by some authorities as a member of
  Proteales. APW (Angiosperm
  Phylogeny Website) considers &nbsp;part of the order&nbsp;Sabiales, &nbsp;&nbsp;</p>
</td>
  <td class="xl65">1</td>
  <td class="xl65">3</td>
  <td class="xl65">66</td>
  <td class="xl67" width="109" style="width:109pt">Sabiaceae</td>
 </tr>
 <tr height="61" style="height:61.0pt">
  <td height="61" style="height:61.0pt">
<b>Trochodendrales</b>
</td>
  <td class="xl64" width="403" style="width:403pt">
<p>
<b>Comprises</b> two
  extant&nbsp;genera, each with a single&nbsp;species<font class="font8">
<sup>[1]</sup>
</font>
<font class="font5">&nbsp;found in south east Asia. S</font>
<font class="font5">econdary xylem without&nbsp;vessel elements, which is quite rare in
  angiosperms</font>
</p>
<p>
<font class="font5">
<br>
</font>
</p>
</td>
  <td class="xl65">1</td>
  <td class="xl65">2</td>
  <td class="xl65">2</td>
  <td class="xl67" width="109" style="width:109pt">Trochodendraceae</td>
 </tr>
 <tr height="42" style="height:42.0pt">
  <td height="42" style="height:42.0pt">
<b>Vahliales&nbsp;</b>
</td>
  <td class="xl69" width="403" style="width:403pt">
<b>Herbs and subshrubs</b> that grow
  in&nbsp;Africa&nbsp;and the&nbsp;Indian subcontinent. Family had previously been placed in the&nbsp;Saxifragales&nbsp;order: &nbsp;reassigned to new order&nbsp;Vahliales&nbsp;in 2016 by the&nbsp;APG IV
  system</td>
  <td class="xl65">1</td>
  <td class="xl65">1</td>
  <td class="xl65">5</td>
  <td class="xl67" width="109" style="width:109pt">Vahliaceae</td>
 </tr>
<!--EndFragment-->
</tbody>
</table>
HTML
)




Page.create!(title: 'Why_study', description: 'Why study unusual fatty acids?', content: <<-HTML
<p class="MsoNormal">
<b style="mso-bidi-font-weight:normal">
<span style="font-size:14.0pt">Why study unusual plant fatty acids?<o:p>
</o:p>
</span>
</b>
</p>
<p class="MsoNormal">
<o:p>&nbsp;</o:p>
</p>
<p class="MsoNormal">Plant membrane lipids contain primarily 6-9 different fatty
acid structures that are 16 or 18 carbons long and have 0 to 3 double bonds. <span style="mso-spacerun:yes">&nbsp;</span>These structures are the same in the membranes
of vegetative tissues of almost all higher plants.</p>
<p class="MsoNormal">In striking contrast, fatty acids found in plant seeds are
extremely diverse. More than 300 different FA structures have been reported to
occur in plant seeds. <span style="mso-spacerun:yes">&nbsp;</span>Some examples of classes of unusual plant fatty acids:<o:p>
</o:p>
</p>
<p class="MsoNormal">
<o:p>&nbsp;</o:p>
</p>
<div align="center">

<table class="MsoNormalTable" border="0" cellspacing="0" cellpadding="0" width="300" style="width:300.05pt;border-collapse:collapse;mso-yfti-tbllook:1184;
 mso-padding-alt:0in 5.4pt 0in 5.4pt">
 <tbody>
<tr style="mso-yfti-irow:0;mso-yfti-firstrow:yes;height:15.0pt">
  <td width="203" nowrap="" colspan="2" valign="bottom" style="width:202.6pt;padding:
  0in 5.4pt 0in 5.4pt;height:15.0pt">
  <p class="MsoNormal">
<span style="mso-ascii-font-family:Calibri;mso-fareast-font-family:
  &quot;Times New Roman&quot;;mso-hansi-font-family:Calibri;mso-bidi-font-family:&quot;Times New Roman&quot;;
  color:black">Short to medium chain length<o:p>
</o:p>
</span>
</p>
  </td>
  <td width="97" nowrap="" valign="bottom" style="width:97.45pt;padding:0in 5.4pt 0in 5.4pt;
  height:15.0pt">
  <p class="MsoNormal">
<span style="mso-ascii-font-family:Calibri;mso-fareast-font-family:
  &quot;Times New Roman&quot;;mso-hansi-font-family:Calibri;mso-bidi-font-family:&quot;Times New Roman&quot;;
  color:black">Branched chain<o:p>
</o:p>
</span>
</p>
  </td>
 </tr>
 <tr style="mso-yfti-irow:1;height:15.0pt">
  <td width="203" nowrap="" colspan="2" valign="bottom" style="width:202.6pt;padding:
  0in 5.4pt 0in 5.4pt;height:15.0pt">
  <p class="MsoNormal">
<span style="mso-ascii-font-family:Calibri;mso-fareast-font-family:
  &quot;Times New Roman&quot;;mso-hansi-font-family:Calibri;mso-bidi-font-family:&quot;Times New Roman&quot;;
  color:black">Very-long chain length<o:p>
</o:p>
</span>
</p>
  </td>
  <td width="97" nowrap="" valign="bottom" style="width:97.45pt;padding:0in 5.4pt 0in 5.4pt;
  height:15.0pt">
  <p class="MsoNormal">
<span style="mso-ascii-font-family:Calibri;mso-fareast-font-family:
  &quot;Times New Roman&quot;;mso-hansi-font-family:Calibri;mso-bidi-font-family:&quot;Times New Roman&quot;;
  color:black">Cyclopropane<o:p>
</o:p>
</span>
</p>
  </td>
 </tr>
 <tr style="mso-yfti-irow:2;height:15.0pt">
  <td width="192" nowrap="" valign="bottom" style="width:191.5pt;padding:0in 5.4pt 0in 5.4pt;
  height:15.0pt">
  <p class="MsoNormal">
<span style="mso-ascii-font-family:Calibri;mso-fareast-font-family:
  &quot;Times New Roman&quot;;mso-hansi-font-family:Calibri;mso-bidi-font-family:&quot;Times New Roman&quot;;
  color:black">Unusual double bond positions<o:p>
</o:p>
</span>
</p>
  </td>
  <td width="11" nowrap="" valign="bottom" style="width:11.1pt;padding:0in 5.4pt 0in 5.4pt;
  height:15.0pt">
</td>
  <td width="97" nowrap="" valign="bottom" style="width:97.45pt;padding:0in 5.4pt 0in 5.4pt;
  height:15.0pt">
  <p class="MsoNormal">
<span style="mso-ascii-font-family:Calibri;mso-fareast-font-family:
  &quot;Times New Roman&quot;;mso-hansi-font-family:Calibri;mso-bidi-font-family:&quot;Times New Roman&quot;;
  color:black">Cyclopropene<o:p>
</o:p>
</span>
</p>
  </td>
 </tr>
 <tr style="mso-yfti-irow:3;height:15.0pt">
  <td width="203" nowrap="" colspan="2" valign="bottom" style="width:202.6pt;padding:
  0in 5.4pt 0in 5.4pt;height:15.0pt">
  <p class="MsoNormal">
<span style="mso-ascii-font-family:Calibri;mso-fareast-font-family:
  &quot;Times New Roman&quot;;mso-hansi-font-family:Calibri;mso-bidi-font-family:&quot;Times New Roman&quot;;
  color:black">Allenic<o:p>
</o:p>
</span>
</p>
  </td>
  <td width="97" nowrap="" valign="bottom" style="width:97.45pt;padding:0in 5.4pt 0in 5.4pt;
  height:15.0pt">
  <p class="MsoNormal">
<span style="mso-ascii-font-family:Calibri;mso-fareast-font-family:
  &quot;Times New Roman&quot;;mso-hansi-font-family:Calibri;mso-bidi-font-family:&quot;Times New Roman&quot;;
  color:black">Cyclopentenyl<o:p>
</o:p>
</span>
</p>
  </td>
 </tr>
 <tr style="mso-yfti-irow:4;height:15.0pt">
  <td width="192" nowrap="" valign="bottom" style="width:191.5pt;padding:0in 5.4pt 0in 5.4pt;
  height:15.0pt">
  <p class="MsoNormal">
<span style="mso-ascii-font-family:Calibri;mso-fareast-font-family:
  &quot;Times New Roman&quot;;mso-hansi-font-family:Calibri;mso-bidi-font-family:&quot;Times New Roman&quot;;
  color:black">Hydroxy<o:p>
</o:p>
</span>
</p>
  </td>
  <td width="11" nowrap="" valign="bottom" style="width:11.1pt;padding:0in 5.4pt 0in 5.4pt;
  height:15.0pt">
</td>
  <td width="97" nowrap="" valign="bottom" style="width:97.45pt;padding:0in 5.4pt 0in 5.4pt;
  height:15.0pt">
  <p class="MsoNormal">
<span style="mso-ascii-font-family:Calibri;mso-fareast-font-family:
  &quot;Times New Roman&quot;;mso-hansi-font-family:Calibri;mso-bidi-font-family:&quot;Times New Roman&quot;;
  color:black">Fluoro<o:p>
</o:p>
</span>
</p>
  </td>
 </tr>
 <tr style="mso-yfti-irow:5;height:15.0pt">
  <td width="192" nowrap="" valign="bottom" style="width:191.5pt;padding:0in 5.4pt 0in 5.4pt;
  height:15.0pt">
  <p class="MsoNormal">
<span style="mso-ascii-font-family:Calibri;mso-fareast-font-family:
  &quot;Times New Roman&quot;;mso-hansi-font-family:Calibri;mso-bidi-font-family:&quot;Times New Roman&quot;;
  color:black">Epoxy<o:p>
</o:p>
</span>
</p>
  </td>
  <td width="11" nowrap="" valign="bottom" style="width:11.1pt;padding:0in 5.4pt 0in 5.4pt;
  height:15.0pt">
</td>
  <td width="97" nowrap="" valign="bottom" style="width:97.45pt;padding:0in 5.4pt 0in 5.4pt;
  height:15.0pt">
  <p class="MsoNormal">
<span style="mso-ascii-font-family:Calibri;mso-fareast-font-family:
  &quot;Times New Roman&quot;;mso-hansi-font-family:Calibri;mso-bidi-font-family:&quot;Times New Roman&quot;;
  color:black">Oxo<o:p>
</o:p>
</span>
</p>
  </td>
 </tr>
 <tr style="mso-yfti-irow:6;height:15.0pt">
  <td width="203" nowrap="" colspan="2" valign="bottom" style="width:202.6pt;padding:
  0in 5.4pt 0in 5.4pt;height:15.0pt">
  <p class="MsoNormal">
<span style="mso-ascii-font-family:Calibri;mso-fareast-font-family:
  &quot;Times New Roman&quot;;mso-hansi-font-family:Calibri;mso-bidi-font-family:&quot;Times New Roman&quot;;
  color:black">Conjugated double bonds<o:p>
</o:p>
</span>
</p>
  </td>
  <td width="97" nowrap="" valign="bottom" style="width:97.45pt;padding:0in 5.4pt 0in 5.4pt;
  height:15.0pt">
  <p class="MsoNormal">
<span style="mso-ascii-font-family:Calibri;mso-fareast-font-family:
  &quot;Times New Roman&quot;;mso-hansi-font-family:Calibri;mso-bidi-font-family:&quot;Times New Roman&quot;;
  color:black">Furan<o:p>
</o:p>
</span>
</p>
  </td>
 </tr>
 <tr style="mso-yfti-irow:7;mso-yfti-lastrow:yes;height:15.0pt">
  <td width="192" nowrap="" valign="bottom" style="width:191.5pt;padding:0in 5.4pt 0in 5.4pt;
  height:15.0pt">
  <p class="MsoNormal">
<span style="mso-ascii-font-family:Calibri;mso-fareast-font-family:
  &quot;Times New Roman&quot;;mso-hansi-font-family:Calibri;mso-bidi-font-family:&quot;Times New Roman&quot;;
  color:black">Acetylenic<o:p>
</o:p>
</span>
</p>
  </td>
  <td width="11" nowrap="" valign="bottom" style="width:11.1pt;padding:0in 5.4pt 0in 5.4pt;
  height:15.0pt">
</td>
  <td width="97" nowrap="" valign="bottom" style="width:97.45pt;padding:0in 5.4pt 0in 5.4pt;
  height:15.0pt">
  <p class="MsoNormal">
<span style="mso-ascii-font-family:Calibri;mso-fareast-font-family:
  &quot;Times New Roman&quot;;mso-hansi-font-family:Calibri;mso-bidi-font-family:&quot;Times New Roman&quot;;
  color:black">Cyano conjugates<o:p>
</o:p>
</span>
</p>
  </td>
 </tr>
</tbody>
</table>

</div>
<p class="MsoNormal">
<o:p>&nbsp;</o:p>
</p>
<p class="MsoNormal">
<b style="mso-bidi-font-weight:normal">Why is it interesting
and useful to study these fatty acids? </b>(Adapted from a presentation by Ed Cahoon)</p>
<p class="MsoNormal">
<b style="mso-bidi-font-weight:normal">
<br>
</b>
<i style="text-indent: -24px;">Biotechnology -- Help farmers and save the planet:</i>
<span style="text-indent: -0.25in;">
</span>
<span style="text-indent: -24px;">&nbsp;Many unusual fatty acids have high value for applications in industry but are not produced in sufficient quantity. Engineering the ‘normal’ fatty acid composition of oilseed crops has been extremely successful.&nbsp;</span>
<span style="text-indent: -0.25in;">
</span>
<span style="text-indent: -24px;">&nbsp;</span>
<span style="text-indent: -0.25in;">
</span>
<span style="text-indent: -24px;">Achieving the same success with high-value unusual fatty acids is an important goal for society that would provide new income for farmers and new renewable resources to replace petroleum.</span>
</p>
<p class="MsoNormal">
<span style="text-indent: -24px;">
<br>
</span>
<i style="text-indent: -0.25in;">Bioprospecting
-- Discover interesting new molecules:</i>
<span style="text-indent: -0.25in;">
</span>
<span style="text-indent: -0.25in;">
</span>
<span style="text-indent: -0.25in;">
</span>
<span style="text-indent: -0.25in;">&nbsp;
</span>
<span style="text-indent: -0.25in;">
</span>
<span style="text-indent: -0.25in;">Much of the chemodiversity of plant fatty acids was discovered as a
result of screening carried out from 1960-1990. A major goal of these projects
was the search for new industrial oils. </span>
<span style="text-indent: -0.25in;">
</span>
<span style="text-indent: -0.25in;">&nbsp;</span>
<span style="text-indent: -0.25in;">
</span>
<span style="text-indent: -0.25in;">But many branches of plant evolution have not
yet been surveyed and many structures remain to be discovered.</span>
</p>
<p class="MsoNormal">
<span style="text-indent: -0.25in;">
<br>
</span>
<i style="text-indent: -0.25in;">Understand
enzyme structure-function relationships:</i>
<span style="text-indent: -0.25in;"> Many unusual fatty acids in plant
seeds are produced by enzymes that evolved as variants of enzymes of membrane
fatty acid metabolism. </span>
<span style="text-indent: -0.25in;">&nbsp;</span>
<span style="text-indent: -0.25in;">Comparing the
structure of these proteins can reveal insights into enzyme reaction mechanisms
and provides a window into “catalytic plasticity”.</span>
</p>
<p class="MsoNormal">
<span style="text-indent: -0.25in;">
<br>
</span>
<i style="text-indent: -0.25in;">Discover novel
pathways and novel biochemistry:</i>
<span style="text-indent: -0.25in;"> </span>
<span style="text-indent: -0.25in;">&nbsp;</span>
<span style="text-indent: -0.25in;">Although we know much about the enzymes that
synthesize many unusual fatty acids, there are still pathways that remain a
mystery. RNASeq is now a fast and inexpensive method to reveal candidate
enzymes involved in specialized seed metabolism.</span>
</p>
<p class="MsoNormal">
<span style="text-indent: -0.25in;">
<br>
</span>
<i style="text-indent: -0.25in;">Uncover how
evolution shaped seed biochemistry:</i>
<span style="text-indent: -0.25in;">
</span>
<span style="text-indent: -0.25in;">&nbsp; </span>
<span style="text-indent: -0.25in;">The
occurrence of unusual fatty acid structures in different branches of plant
phylogeny can tell us about parallel and convergent evolution of enzymes and
reveal new insights into how pathways evolved.</span>
</p>
<p class="MsoNormal">
<span style="text-indent: -0.25in;">
<br>
</span>
<b style="text-indent: -0.25in;">Are there more unique
fatty acid structures still to be discovered?</b>
</p>
<p class="MsoNormal">Examination of all the plant species represented in PlantFAdb-SOFA,
together with recent phylogenetic information allows us to identify branches in
plant evolution whose seeds may not have been analyzed for fatty acid
composition. <b>Perhaps&nbsp;25% of plant orders and 50% of plant families have
not been analyzed for FA composition</b>.&nbsp;Therefore, many (perhaps more
than 100) new fatty acid structures might yet be discovered.&nbsp;<b>&nbsp;</b>This
<a href="https://phylofadb.bch.msu.edu/pages/Whats_Missing">table</a> presents
information on branches of the plant kingdom that have had little or no fatty
acid analysis.<o:p>
</o:p>
</p>
<p class="MsoNormal">
<o:p>&nbsp;</o:p>
<span style="line-height: 1.42857;">It is important to note that many novel fatty acids may have
been missed in previous analyses because they do not elute from standard GC
columns, or were missed due to their instability to derivatization or other
procedures. HPLC and newer lipidomic techniques will allow more types of
structures to be discovered. &nbsp;A very valuable review of methods for analysis of unusual FA in seeds is: &nbsp;</span>
<span style="color: rgb(51, 51, 51); text-align: justify; text-indent: -19.2px; font-family: Helvetica; font-size: 11pt;">
<o:p>
<b>Spitzer, V.&nbsp;</b>(1999)&nbsp;</o:p>
</span>
<span style="color: rgb(51, 51, 51); text-align: justify; text-indent: -19.2px;">Screening analysis of unknown seed oils</span>
<b style="color: rgb(51, 51, 51); text-align: justify; text-indent: -0.2in; font-family: &quot;Times New Roman&quot;; font-size: 10pt;">
<span style="font-size: 11pt; font-family: Helvetica;">
<o:p>&nbsp;</o:p>
</span>
</b>
<i style="text-align: justify; text-indent: -19.2px; font-family: Arial, sans-serif; font-size: 13px; color: rgb(34, 34, 34);">Lipid/Fett</i>
<span style="text-align: justify; text-indent: -19.2px; font-family: Arial, sans-serif; font-size: 13px; color: rgb(34, 34, 34);">,</span>
<i style="text-align: justify; text-indent: -19.2px; font-family: Arial, sans-serif; font-size: 13px; color: rgb(34, 34, 34);">101</i>
<span style="text-align: justify; text-indent: -19.2px; font-family: Arial, sans-serif; font-size: 13px; color: rgb(34, 34, 34);">(1), 2-19.&nbsp;</span>
<font color="#222222" face="Arial, sans-serif" style="text-align: justify; text-indent: -19.2px;">
<span style="font-size: 13px;">
<b>doi:10.1002/(SICI)1521-4133(19991)101:1&lt;2::AID-LIPI2&gt;3.0.CO;2-H</b>
</span>
</font>
</p>
<p class="MsoNormal">
<o:p>
</o:p>
</p>
<p class="MsoNormal">
<o:p>&nbsp;</o:p>
</p>
<p class="MsoNormal">
<b style="mso-bidi-font-weight:normal">Selected</b> <b style="mso-bidi-font-weight:normal">reviews:</b>
<span style="mso-spacerun:yes">&nbsp;&nbsp;</span>
</p>
<p class="MsoNormal" style="margin-top:0in;margin-right:0in;margin-bottom:3.0pt;
margin-left:22.5pt;text-align:justify;text-justify:inter-ideograph;text-indent:
-.2in;background:white">
<b>
<span style="font-size:11.0pt;font-family:Helvetica;
mso-bidi-font-family:&quot;Times New Roman&quot;;color:#333333">Badami, R.C.,
and&nbsp;Patil, K.B.</span>
</b>
<b>
<span style="font-size:10.0pt;font-family:
&quot;Times New Roman&quot;;color:#333333">&nbsp;</span>
</b>
<span style="font-size:11.0pt;
font-family:Helvetica;mso-bidi-font-family:&quot;Times New Roman&quot;;color:#333333">&nbsp;(1981).&nbsp;Structure
and Occurrence of Unusual Fatty Acids in Minor Seed Oils.&nbsp;Progress in
Lipid Research&nbsp;<b>19,</b>119-153.&nbsp;&nbsp;&nbsp;&nbsp;<b>10.1016/0163-7827(80)90002-8</b>
</span>
<span style="font-size:10.0pt;font-family:&quot;Times New Roman&quot;;color:#333333">
<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin-top:0in;margin-right:0in;margin-bottom:3.0pt;
margin-left:22.5pt;text-align:justify;text-justify:inter-ideograph;text-indent:
-.2in;background:white">
<b>
<span style="font-size:11.0pt;font-family:Helvetica;
mso-bidi-font-family:&quot;Times New Roman&quot;;color:#333333">Christensen, L.P., and
Brandt, K.</span>
</b>
<b>
<span style="font-size:10.0pt;font-family:&quot;Times New Roman&quot;;
color:#333333">&nbsp;</span>
</b>
<span style="font-size:11.0pt;font-family:Helvetica;
mso-bidi-font-family:&quot;Times New Roman&quot;;color:#333333">&nbsp;(2006). Acetylenes
and&nbsp;Psoralens&nbsp;<b>, in&nbsp;</b>Plant Secondary Metabolites:
Occurrence, Structure and Role in the Human Diet<b>&nbsp;</b>137-173.&nbsp;&nbsp;&nbsp;&nbsp;<b>10.1002/9780470988558.ch5</b>&nbsp;&nbsp;</span>
<span style="font-size:10.0pt;font-family:&quot;Times New Roman&quot;;color:#333333">
<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin-top:0in;margin-right:0in;margin-bottom:3.0pt;
margin-left:22.5pt;text-align:justify;text-justify:inter-ideograph;text-indent:
-.2in;background:white">
<b>
<span style="font-size:11.0pt;font-family:Helvetica;
mso-bidi-font-family:&quot;Times New Roman&quot;;color:#333333">Dembitsky, V.M.,
and&nbsp;Srebnik, M.&nbsp;</span>
</b>
<b>
<span style="font-size:10.0pt;
font-family:&quot;Times New Roman&quot;;color:#333333">&nbsp;</span>
</b>
<span style="font-size:11.0pt;font-family:Helvetica;mso-bidi-font-family:&quot;Times New Roman&quot;;
color:#333333">(2002).<b>&nbsp;</b>Natural Halogenated Fatty Acids: Their
Analogues and Derivatives.&nbsp;Progress in Lipid Research 41, 315-367.&nbsp;<b>&nbsp;&nbsp;&nbsp;&nbsp;10.1016/s0163-7827(02)00003-6</b>
</span>
<span style="font-size:10.0pt;font-family:&quot;Times New Roman&quot;;color:#333333">
<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin-top:0in;margin-right:0in;margin-bottom:3.0pt;
margin-left:22.5pt;text-align:justify;text-justify:inter-ideograph;text-indent:
-.2in;background:white">
<b>
<span style="font-size:11.0pt;font-family:Helvetica;
mso-bidi-font-family:&quot;Times New Roman&quot;;color:#333333">Hildebrand, D.&nbsp;</span>
</b>
<b>
<span style="font-size:10.0pt;font-family:&quot;Times New Roman&quot;;color:#333333">&nbsp;</span>
</b>
<span style="font-size:11.0pt;font-family:Helvetica;mso-bidi-font-family:&quot;Times New Roman&quot;;
color:#333333">(2010) Production of Unusual Fatty Acids in Plants</span>
<span style="font-size:10.0pt;font-family:&quot;Times New Roman&quot;;color:#333333">&nbsp;
&nbsp; &nbsp;</span>
<b>
<span style="font-size:11.0pt;font-family:Helvetica;
mso-bidi-font-family:&quot;Times New Roman&quot;;color:#333333">&nbsp;http://lipidlibrary.aocs.org/Biochemistry/content.cfm?ItemNumber=40317</span>
</b>
<span style="font-size:10.5pt;font-family:&quot;Helvetica Neue&quot;;mso-bidi-font-family:&quot;Times New Roman&quot;;
color:#333333">
<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin-top:0in;margin-right:0in;margin-bottom:3.0pt;
margin-left:22.5pt;text-align:justify;text-justify:inter-ideograph;text-indent:
-.2in;background:white">
<b>
<span style="font-size:11.0pt;font-family:Helvetica;
mso-bidi-font-family:&quot;Times New Roman&quot;;color:#333333">Mangold, H.K.
and&nbsp;Spener, F.,&nbsp;</span>
</b>
<b>
<span style="font-size:10.0pt;
font-family:&quot;Times New Roman&quot;;color:#333333">&nbsp;</span>
</b>
<span style="font-size:11.0pt;font-family:Helvetica;mso-bidi-font-family:&quot;Times New Roman&quot;;
color:#333333">(1977).&nbsp;The&nbsp;cyclopentenyl&nbsp;fatty
acids.&nbsp;In&nbsp;Lipids and Lipid Polymers in Higher Plants&nbsp;(pp.
85-101).&nbsp;Springer Berlin Heidelberg.&nbsp;<b>&nbsp;ISBN: 978-3-642-66632-2
(Online)</b>
</span>
<span style="font-size:10.0pt;font-family:&quot;Times New Roman&quot;;
color:#333333">
<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin-top:0in;margin-right:0in;margin-bottom:3.0pt;
margin-left:22.5pt;text-align:justify;text-justify:inter-ideograph;text-indent:
-.2in;background:white">
<b>
<span style="font-size:11.0pt;font-family:Helvetica;
mso-bidi-font-family:&quot;Times New Roman&quot;;color:#333333">Mawlong,
I.,&nbsp;Sujith&nbsp;Kumar, M.S., and Singh, D. (</span>
</b>
<b>
<span style="font-size:10.0pt;font-family:&quot;Times New Roman&quot;;color:#333333">&nbsp;</span>
</b>
<span style="font-size:11.0pt;font-family:Helvetica;mso-bidi-font-family:&quot;Times New Roman&quot;;
color:#333333">2014). Furan Fatty Acids: Their Role in Plant
Systems.&nbsp;&nbsp;Phytochemistry&nbsp;&nbsp;Reviews 15, 121-127.&nbsp;<b>&nbsp;&nbsp;&nbsp;&nbsp;10.1007/s11101-014-9388-7</b>
</span>
<span style="font-size:10.0pt;font-family:&quot;Times New Roman&quot;;color:#333333">
<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin-top:0in;margin-right:0in;margin-bottom:3.0pt;
margin-left:22.5pt;text-align:justify;text-justify:inter-ideograph;text-indent:
-.2in;background:white">
<b>
<span style="font-size:11.0pt;font-family:Helvetica;
mso-bidi-font-family:&quot;Times New Roman&quot;;color:#333333">McKeon, T., Hayes, D.,
Hildebrand, D., &amp;&nbsp;Weselake, R. (Eds.).</span>
</b>
<b>
<span style="font-size:10.0pt;font-family:&quot;Times New Roman&quot;;color:#333333">&nbsp;</span>
</b>
<b>
<span style="font-size:11.0pt;font-family:Helvetica;mso-bidi-font-family:&quot;Times New Roman&quot;;
color:#333333">&nbsp;</span>
</b>
<b>
<span style="font-size:10.0pt;font-family:
&quot;Times New Roman&quot;;color:#333333">&nbsp;</span>
</b>
<span style="font-size:11.0pt;
font-family:Helvetica;mso-bidi-font-family:&quot;Times New Roman&quot;;color:#333333">(2016).Industrial&nbsp;Oil
Crops. Elsevier.<b>&nbsp;eBook&nbsp;ISBN :9780128053850</b>
</span>
<span style="font-size:10.0pt;font-family:&quot;Times New Roman&quot;;color:#333333">
<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin-top:0in;margin-right:0in;margin-bottom:3.0pt;
margin-left:22.5pt;text-align:justify;text-justify:inter-ideograph;text-indent:
-.2in;background:white">
<b>
<span style="font-size:11.0pt;font-family:Helvetica;
mso-bidi-font-family:&quot;Times New Roman&quot;;color:#333333">Napier, J.A.&nbsp;</span>
</b>
<b>
<span style="font-size:10.0pt;font-family:&quot;Times New Roman&quot;;color:#333333">&nbsp;</span>
</b>
<span style="font-size:11.0pt;font-family:Helvetica;mso-bidi-font-family:&quot;Times New Roman&quot;;
color:#333333">(2007).&nbsp;The Production of Unusual Fatty Acids in Transgenic
Plants.&nbsp;Annu&nbsp;Rev Plant&nbsp;Biol&nbsp;58, 295-319.<b>&nbsp;&nbsp;&nbsp;10.1146/annurev.arplant.58.032806.103811<o:p>
</o:p>
</b>
</span>
</p>
<p class="MsoNormal" style="margin-top:0in;margin-right:0in;margin-bottom:3.0pt;
margin-left:22.5pt;text-align:justify;text-justify:inter-ideograph;text-indent:
-.2in;background:white">
<b style="mso-bidi-font-weight:normal">
<span style="font-size:11.0pt;font-family:Helvetica;mso-bidi-font-family:&quot;Times New Roman&quot;;
color:#333333">Shanklin, J., and Cahoon, E. B.</span>
</b>
<span style="font-size:11.0pt;font-family:Helvetica;mso-bidi-font-family:&quot;Times New Roman&quot;;
color:#333333"> (1998). Desaturation and related modifications of fatty acids.&nbsp;Annual
Review of Plant Biology,&nbsp;49, 611-641.<o:p>
</o:p>
</span>
</p>
<p class="MsoNormal" style="margin-top:0in;margin-right:0in;margin-bottom:3.0pt;
margin-left:22.5pt;text-align:justify;text-justify:inter-ideograph;text-indent:
-.2in;background:white">
<span style="color: rgb(51, 51, 51); text-indent: -19.2px; font-family: Helvetica; font-size: 11pt;">
<o:p>
<b>Spitzer, V.&nbsp;</b>(1999)&nbsp;</o:p>
</span>
<span style="color: rgb(51, 51, 51); text-indent: -19.2px;">Screening analysis of unknown seed oils</span>
<b style="color: rgb(51, 51, 51); text-indent: -0.2in; font-family: &quot;Times New Roman&quot;; font-size: 10pt;">
<span style="font-size: 11pt; font-family: Helvetica;">
<o:p>&nbsp;</o:p>
</span>
</b>
<i style="text-indent: -19.2px; font-family: Arial, sans-serif; font-size: 13px; color: rgb(34, 34, 34);">Lipid/Fett</i>
<span style="text-indent: -19.2px; font-family: Arial, sans-serif; font-size: 13px; color: rgb(34, 34, 34);">,</span>
<i style="text-indent: -19.2px; font-family: Arial, sans-serif; font-size: 13px; color: rgb(34, 34, 34);">101</i>
<span style="text-indent: -19.2px; font-family: Arial, sans-serif; font-size: 13px; color: rgb(34, 34, 34);">(1), 2-19.&nbsp;</span>
<font color="#222222" face="Arial, sans-serif" style="text-indent: -19.2px;">
<span style="font-size: 13px;">
<b>doi:10.1002/(SICI)1521-4133(19991)101:1&lt;2::AID-LIPI2&gt;3.0.CO;2-H</b>
</span>
</font>
<span style="font-size:10.0pt;font-family:&quot;Times New Roman&quot;;
color:#333333">
<o:p>&nbsp;</o:p>
</span>
<span style="line-height: 1.42857;">&nbsp;</span>
</p>
HTML
)
