$( function(){
  $('form #doi_lookup').on('click',function(){
    var doi = $("#pub_doi").val();
    $.get( "http://api.crossref.org/works/"+doi, function(data) {
      console.log("lookup crossref")
      console.log(data)
      ref = data.message;
      try {
        var title = ref.title.join('; ');
      } catch (e) { var title = ''}
      try {
        var year = ref.issued['date-parts'][0];
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
  
  $('form #wos_uid_lookup').on('click',function(){
    var wos_uid = $("#pub_wos_uid").val();
    $.get('/pubs/check_wos_uid', {uid: wos_uid}, function(data){
      console.log("check wos id")
      console.log(data)
      if(data.pub){
        $('#pub_wos_title').val(data.pub.wos_title);
        $('#pub_wos_year').val(data.pub.wos_year);
        $('#pub_wos_authors').val(data.pub.wos_authors);
        $('#pub_wos_journal').val(data.pub.wos_journal);
        $('#pub_wos_volume').val(data.pub.wos_volume);
        $('#pub_wos_pages').val(data.pub.wos_pages);
      }
    });
    
  })
});