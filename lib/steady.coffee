Liquid = require('liquid');
#Liquid.Partial.registerTemplates();  # Finds all script tags with type="text/liquid" and registers them as partials

#console.log jsyaml.load('greeting: hello\nname: world')

generate_index = (callback)->
  $.get '../template/_layouts/default.html', (data)->
    callback Liquid.Template.parse(data).render
      site:
        name: "123"

#page = $('#page');
#pageTemplate = page.html();
#page.html(Liquid.Template.parse(pageTemplate).render({ foobar: 'bizbuzz', cheer: true })).show();

generate_all = (callback)->
  generate_index (index)->
    callback
      'index.html': index

generate_all (result)->
  console.log result

github = new Github
    username: "zh99998",
    password: "zh112998",
    auth: "basic"

repo = github.getRepo('zh99998', 'test')
#repo.show (err, repo)->
#  console.log err, repo

repo.getTree 'master?recursive=true', (err, tree)->
  console.log err,tree
