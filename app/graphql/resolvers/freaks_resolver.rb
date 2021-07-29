# frozen_string_literal: true

module Resolvers
  class FreaksResolver < Resolvers::Base
    type [Types::FreakType], null: false

    def resolve
      [
        {
          id: '1',
          name: 'Doru Pirvu',
          photo: 'https://bit.ly/3y7afHO',
          description: 'The boss.'
        },
        {
          id: '2',
          name: 'Alex Negru',
          photo: 'https://bit.ly/3y7afHO',
          description: 'Intern driver.'
        }
      ]
    end
  end
end
