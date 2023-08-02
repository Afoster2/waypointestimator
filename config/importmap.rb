# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "stimulus", to: "stimulus/lib/index.js", preload: true
pin_all_from "https://unpkg.com/stimulus@3.2.1/dist/", under: "stimulus"
pin "stimulus", to: "https://unpkg.com/stimulus@3.2.1/dist/stimulus.js"
pin "jquery", to: "https://ga.jspm.io/npm:jquery@3.7.0/dist/jquery.js"


