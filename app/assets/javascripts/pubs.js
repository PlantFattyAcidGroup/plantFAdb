$( function(){		 
  $('form #doi_lookup').on('click',function(){		 
    var doi = $("#pub_doi").val();		 
    $.get( "https://api.crossref.org/works/"+doi, function(data) {		 
      console.log("lookup crossref")		 
      console.log(data)		 
      ref = data.message;
      try {
        var title = ref.title.join('; ');
      } catch (e) { var title = ''} 
      try {		 
        var year = ref.issued['date-parts'][0][0];
      } catch (e) { var year = ''} 
      try {		 
        var authors = ref.author.map(function(a){return a.family+', '+a.given}).join('; ');		 
      } catch (e) { var authors = ''}
      try {		 
        var journal = ref['container-title'][0];		 
      } catch (e) { var journal = ''}
      try {		 
        var volume = ref.volume;		 
      } catch (e) { var volume = ''} 
      try {		 
        var pages = ref.page;		 
      } catch (e) { var pages = ''}

      $('#pub_wos_title').val(title);
      $('#pub_wos_year').val(year);
      $('#pub_wos_authors').val(authors);
      $('#pub_wos_journal').val(journal);
      $('#pub_wos_volume').val(volume);
      $('#pub_wos_pages').val(pages);
    })
    .fail(function() {
      alert( "error" );
    })
  })
  
  $(function () {
    $('[data-toggle="tooltip"]').tooltip({placement: 'right auto'})
    $('[data-toggle="popover"]').popover({placement: 'right auto'})
  })
  
  function toggleIcon(e) {
      $(e.target)
          .prev('.panel-heading')
          .find(".more-less")
          .toggleClass('glyphicon-plus glyphicon-minus');
  }
  $('.dataset-panel').on('hidden.bs.collapse', toggleIcon);
  $('.dataset-panel').on('shown.bs.collapse', toggleIcon);
  
});

