# frozen_string_literal: true

module Resolvers
  class FreaksResolver < Resolvers::Base
    type [Types::FreakType], null: false

    def resolve
      [
        {
          id: '1',
          name: 'Doru Pirvu',
          photo: {
            id: '1',
            uri: 'https://bit.ly/3y7afHO'
          },
          description: 'The boss.',
          skills: [{
            id: '1',
            name: 'Project manangement'
          },
                   {
                     id: '2',
                     name: 'AWS Architect'
                   }],
          projects: [{
            id: '1',
            name: 'EPIX',
            description: 'An American premium cable and satellite TV network.',
            photo: {
              id: '1',
              uri: 'https: //bit.ly/3y7afHO'
            },
            technologies: [{
              id: '2',
              name: 'Ruby',
              description: 'A popular backend language.'
            }]
          }],
          role: {
            id: '1',
            name: 'Founder'
          },
          level: {
            id: '3',
            name: 'Advanced'
          },
          norm: {
            id: '1',
            name: 'full-time'
          },
          speciality: [{
            id: '2',
            name: 'Backend'
          }]
        },
        {
          id: '2',
          name: 'Alex Negru',
          photo: {
            id: '1',
            uri: 'https://bit.ly/3y7afHO'
          },
          description: 'Intern driver.',
          skills: [{
            id: '1',
            name: 'Backend developer'
          },
                   {
                     id: '2',
                     name: 'driver'
                   }],
          projects: [{
            id: '1',
            name: 'EPIX',
            description: 'An American premium cable and satellite TV network.',
            photo: {
              id: '1',
              uri: 'https://bit.ly/3rB9Yu9'
            },
            technologies: [{
              id: '2',
              name: 'Ruby',
              description: 'A popular backend language.'
            }]
          }],
          role: {
            id: '1',
            name: 'Software developer'
          },
          level: {
            id: '3',
            name: 'Advanced'
          },
          norm: {
            id: '1',
            name: 'full-time'
          },
          speciality: [{
            id: '2',
            name: 'Backend'
          }]
        }
      ]
    end
  end
end
