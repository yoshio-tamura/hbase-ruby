module HBase
  module Request
    class RowRequest < BasicRequest
      attr_reader :table_name
      attr_reader :name
      attr_reader :timestamp

      def initialize(table_name, name, timestamp=nil)
        @table_name, @name, @timestamp = CGI.escape(table_name), CGI.escape(name), timestamp
        path = "/#{@table_name}/row/#{@name}"
        path << "/#{@timestamp}" if timestamp
        super(path)
      end

      def show(columns = nil, options = { })
        if columns
          @path << "?#{pack_params(columns)}"
          @path << "&version=#{options[:version]}" if options[:version]
          @path << "&offset=#{options[:offset]}" if options[:offset]
          @path << "&limit=#{options[:limit]}" if options[:limit]
        end
        @path
      end

      def create
        @path
      end

      def delete(columns = nil)
        @path << "?#{pack_params(columns)}" if columns
        @path
      end
    end
  end
end
