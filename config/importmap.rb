# Pin npm packages by running ./bin/importmap

# Application
pin "application", preload: true

# Hotwired libraries
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true

# Controllers
pin_all_from "app/javascript/controllers", under: "controllers"

# External libraries
pin "jquery", to: "https://ga.jspm.io/npm:jquery@3.7.0/dist/jquery.js"
