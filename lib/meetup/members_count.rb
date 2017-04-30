require 'net/http'

module Meetup
  class MembersCount
    def self.total
      new.total
    end

    def initialize
      @key = ENV['MEETUP_KEY']
    end

    def members_count
      REDIS.get('meetup_members')
    end

    def get_meetup_members
      json = ::Net::HTTP.get(URI("https://api.meetup.com/2/groups?group_urlname=parisrb&format=json"))
      parisrb = JSON.parse(json)
      REDIS.set('meetup_members', parisrb['members'])
      REDIS.expire('meetup_members', 24.hours)
      members_count
    end

    def total
      members_count || get_meetup_members
    end
  end
end
