module Blazer
  class SmartVariablesController < BaseController
    # /data_sources/:data_source_id/smart_variables/:id(.:format)
    def show
      puts "here"
      data_source = Blazer.data_sources[params[:data_source_id]]
      smart_var, error = parse_smart_variables(params[:id], data_source)
      smart_var_hash = smart_var.map {|values| {name: values[0], id: values[1]} }
      if stale?(smart_var_hash)
        render json: smart_var_hash
      end
    end
  end
end
