# Formulan [![Build Status](https://secure.travis-ci.org/ariejan/formulan.png)](http://travis-ci.org/ariejan/formulan)

Formulan allows you to easily add general purpose forms to your Rails application. You define the form and Formulan takes cares that submitted forms are stored serialized in your database.

You need to collect information, but you are not particularly interested in it from your application's point of view.

Formulan is great for contact request forms, information requests or simple questionnaires.

## Build status

> TODO: Use the travis.

## Current development status

Formulan is not yet feature complete, but stable enough to use in production.

## Installation

Add this line to your application's Gemfile:

    gem 'formulan'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install formulan

Then generate the migration needed for Formulan:

    $ rails generate formulan:migration

And migrate your database:

    $ rake db:migrate

## Usage

Create a form in `apps/forms`. For example `app/forms/contract_form.rb`:

    Formulan.define :contact_form do
      string :name,         label: "Your name",     required: true
      string :email,        label: "Your email",    required: true
      radio  :reason,       label: "What can we do for you?", |
        values: ["Tech suppport", "Sales", "Job inquery"]

      text   :motivation,   label: "Ask us anything"
      checkbox :cc,         label: "Send me a copy of this message", |
        default: true

      submit label: "Send"
    end

Next, you can render this form in your views like so:

    %h2 Contact us
    %p
        Please fill out the form below and a human will contact you
        as soon as possible.
        
    = formulan :contact_form
    
### Supported field types

Formular currently supports the following field types:

 * `string`, asks for a string in a `text_field`.
 * `text`, same as `string`, but creates a `textarea`.
 * `radio`, asks for a selection of one option using radio buttons.
 * `select`, asks for a selection of one option using a select box.
 * `checkbox`, asks for a boolean choice using a checkbox.
 * `submit`, creates a submit button.
    
### About changing field names and types

Formulan does not care. Once a form is submitted and stored in your database
Formulan never uses that data again.

If you export the form data, you need to take care of any conversions or
type incompatibilities. To make this easier, you could version your forms.

### Versioning your forms

Versioning your forms is nothing more than including a hidden `version` field in your form

    Formulan.define :newsletter_signup do
      hidden :version,  value: 42
      string :email,    label: "Your email",    required: true
      
### Hooks

There are two callbacks you can hook into:

 * `before_save`
 * `after_save`
 
Sending an email with the proper data could work like this:

    Formulan.define :contact_form do
      string :email
      
      after_save do |data|
        NotificationMailer.contact_form(data).deliver
      end
      
The `before_save` can be used to manipulate data before it's stored:

    Formulan.define :movie_rating do
      string :movie_title, label: "What movie do you want to rate?"
      string :rating,      label: "Rating 1 upto 10"
      
      before_save do |data|
        # Force 1 <= (int)rating <= 10
        data[:rating] = [10, [1, data[:rating].to_i].max].min
      end
      
### Exporting your data

The entire form is stored as a serialized ruby Hash in a single `text` database column. This means that you cannot perform queries on the data itself, but you are free to export the data for use elsewhere.

For this form: 

    Formulan.define :contact_form do
      string :email

You could print a list of email addresses like this:

    Formulan::Model.where(identifier: :contact_form).find_each do |entry|
      puts entry[:email]
    end


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

Formulan is released under the MIT license.

 * [http://www.opensource.org/licenses/MIT](http://www.opensource.org/licenses/MIT)
