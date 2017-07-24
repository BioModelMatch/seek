class SimpleBaseSerializer
  include JSONAPI::Serializer
  def self_link
    #{base_url}//#{type}/#{id}
    "/#{type}/#{id}"
  end

  def base_url
    Seek::Config.site_base_host
  end

  #remove link to object/associated --> "#{self_link}/#{format_name(attribute_name)}"
  def relationship_self_link(attribute_name)
  end

  #remove link to object/related/associated
  def relationship_related_link(attribute_name)
  end

  def meta
    if object.respond_to?('created_at')
      created = object.created_at
      updated = object.updated_at
    end
    {
        created: created || "",
        modified: updated || ""
    }
  end

  def jsonapi
        {
            "version": "1.0"
        }
  end

end