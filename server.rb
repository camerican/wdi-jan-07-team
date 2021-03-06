# server.rb
require 'sinatra'
require 'sendgrid-ruby'
require 'sinatra/flash'
require 'activerecord'
require 'sinatra/activerecord'
#require './models'

set :database, "sqlite3:test.db"

enable :sessions

before do
  #to do for 2/14: Switch from a hard-coded hash
  # to a roster table within our DB
  @roster = [
    {first: "Ber",
     last: "Cohen",
     slack: "bercohen",
     image: "https://ca.slack-edge.com/T03JJLPSP-U3HF7N9HT-6d319e48abd6-512"
    },{first: "Robert",
     last: "Rappole",
     slack: "rappole4",
     image: "https://ca.slack-edge.com/T03JJLPSP-U2X8JUNKV-4a6a1f3ba25b-512"
    },{first: "James",
     last: "Sullivan",
     slack: "jamessullivan77",
     image: "https://ca.slack-edge.com/T03JJLPSP-U3D8VHD47-4292f61e0c1e-512"
    },{first: "Nick",
     last: "Vaden",
     slack: "nickvaden",
     image: "https://ca.slack-edge.com/T03JJLPSP-U3CENEZV0-b1bb1a03cd6d-1024"
    },{first: "Steven",
     last: "DeLeon",
     slack: "steviedeee",
     image: "https://ca.slack-edge.com/T03JJLPSP-U218Q8VT9-25ba9d9576d5-512"
    },{first: "Angelina",
     last: "Hill",
     slack: "angieh",
     image: "https://ca.slack-edge.com/T03JJLPSP-U3FU6EBFX-ec5c252cfd78-512"
    },{first: "Selcuk",
     last: "Erol",
     slack: "selcukerol",
     image: "https://ca.slack-edge.com/T03JJLPSP-U3LP0D01G-09c5654afa5a-512"
    },{first: "Kyle",
     last: "Harmon",
     slack: "kyleharmon",
     image: "https://ca.slack-edge.com/T03JJLPSP-U3GLLSY3D-748164cbfcab-1024"
    },{first: "Eric",
     last: "Sui",
     slack: "erics",
     image: "https://ca.slack-edge.com/T03JJLPSP-U3LN9RZRR-ed66a04997e5-1024"
    },{first: "Alfe",
     last: "Corona",
     slack: "alfecorona",
     image: "https://ca.slack-edge.com/T03JJLPSP-U2JAH1V6E-11ac6f1e6524-512"
    },{first: "Jarvis",
     last: "Potter",
     slack: "jarviskpotter",
     image: "https://ca.slack-edge.com/T03JJLPSP-U38R6AHNU-gf1d4623b78a-48"
    },{first: "Joel",
     last: "Jester",
     slack: "joel.jester",
     image: "https://ca.slack-edge.com/T03JJLPSP-U3KHZ6GH5-2bb0068bcc3d-1024"
    },{first: "Hak",
     last: "Lim",
     slack: "hcl510",
     image: "https://ca.slack-edge.com/T03JJLPSP-U3L2Z36TA-aa8fa8c3944d-512"
    },{first: "Mauricio",
     last: "Garcia",
     slack: "garmauricio89",
     image: "https://ca.slack-edge.com/T03JJLPSP-U3EGF95DL-b63d727d981e-512"
    }
  ]
end

get '/' do
  @users = User.all
  p User.find(1)
  erb :home
end

get '/contact' do
  erb :contact
end

post '/contact' do
    #to do: process the email sending
    # our sendgrid code should be here
    from = SendGrid::Email.new email: params[:email]
    subject = params[:subject]
    to = SendGrid::Email.new email: "cam@nycda.com"

    content = SendGrid::Content.new(
        type: 'text/plain',
        value: params[:comment] 
    )

    mail = SendGrid::Mail.new(from,subject,to,content)

    sg = SendGrid::API.new( api_key: ENV['SENDGRID_API_KEY'])

    response = sg.client.mail._('send').post(request_body: mail.to_json)

    #params.inspect
    flash[:confirm] = "We received your email, thanks for your time."
    redirect '/'
end


get '/profile/:student' do
  # try to find the current student based on the url
  @student = @roster.select {|x| x[:first].downcase == params[:student].downcase }.first
  redirect '/' unless @student # make sure we found a student that matches from our roster
  erb :profile
end


