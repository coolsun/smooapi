# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([
    {
        email: 'aa', 
        encrypted_password: '$2a$11$GQ7j8TqYfKYNrtuHhj9OzOCOgUQyus64OMbK/AQAeQCBTawVDWgju'},
    {
        email: 'aa@test.com', 
        encrypted_password: '$2a$11$f7H4jPkuqldPk/GfG2XmceBKSH61nuxfJNnagoARQrvxkzqATSuYC'}
    ])
cateries = Category.create([
    {
        name:'emergency',
        description: 'Raise fund for emergency'
    },
    {
        name:'memorial',
        description: 'Raise fund for memorial'
    },
    {
        name:'animal-rescue',
        description: 'Raise fund for animal-rescue'
    },
    {
        name:'medical',
        description: 'Raise fund for medical'
    },
    {
        name:'charity',
        description: 'Raise fund for charity'
    }
])
campaigns = Campaign.create([
    {
        user_id: 1,
        category_id: 2,
        name:'education',
        goal:1000,
        description: 'Raise money and ambition for my master degree'
    },
    {
        user_id: 1,
        category_id: 3,
        name:'no shocker',
        goal:500,
        description: 'Raise money for the little trooper'
    },
])

comments = Comment.create([
    {
        user_id: 1,
        campaign_id: 2,
        content:'It is a touching story.  I would like to donate $100.'
    },
    {
        user_id: 2,
        campaign_id: 1,
        content:'It is an emergency for my best friend Po and he is a very nic guy.  Please donate if you could.'
    },
])

donations = Donation.create([
    {
        user_id: 1,
        campaign_id: 2,
        amount:100
    },
    {
        user_id: 2,
        campaign_id: 1,
        amount:900
    },
    {
        user_id: 1,
        campaign_id: 2,
        amount:300
    },
])
