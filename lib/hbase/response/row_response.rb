module HBase
  module Response
    class RowResponse < BasicResponse
      def parse_content(raw_data)
        doc = REXML::Document.new(raw_data)
        row = doc.elements["row"]
        rname = row.elements["name"].text.strip.unpack("m").first
        columns = []
        # Need fix in the server side
        count = row.elements["count"].text.strip.to_i rescue 0
        row.elements["columns"].elements.each("column") do |col|
          name = col.elements["name"].text.strip.unpack("m").first
          value = col.elements["value"].text.strip.unpack("m").first rescue nil
          timestamp = col.elements["timestamp"].text.strip.to_i
          columns << Model::Column.new(:name => name,
                                       :value => value,
                                       :timestamp => timestamp)
        end
        Model::Row.new(:name => rname, :total_count => count, :columns => columns)
      end
    end
  end
end
