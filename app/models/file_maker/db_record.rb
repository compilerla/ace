module FileMaker
  
  class DbRecord
    class TableNameNotSet < StandardError; end

    private

    class << self
      def where(attrs)
        connection = ActiveRecord::Base.connection
        query = "SELECT * FROM #{table_name} WHERE #{attrs_to_str(attrs)}"
        p query
        connection.execute(query)
      end

      def attrs_to_str(attrs)
        attrs.map do |k, v|
          "#{k} = '#{v}'"
        end.join(" AND ")
      end

      def table_name
        raise TableNameNotSet unless @@table_name
        @@table_name
      end

      def set_table_name(table_name)
        @@table_name = table_name
      end

      def connection
        ActiveRecord::Base.connection
      end
    end
  end

end