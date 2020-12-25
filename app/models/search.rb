class Search
    attr_accessor :player_id, :game_id

    def initialize args
        args.each do |k,v|
            instance_variable_set("@#{k}", v) unless v.nil?
        end
    end
    
    include Searches::SearchStats
end