module CommonUtils
  def CommonUtils.get_gmap_hash(object)
    Gmaps4rails.build_markers(object) do |user, marker|
       marker.lat user.lat
       marker.lng user.lng
       marker.infowindow user.vicinity
       # marker.title user.title
       marker.picture({
         :url => ActionController::Base.helpers.asset_path('marker_red.png'),
         :width   => 32,
         :height  => 32
        })
       marker.json({:id => user.id})
    end
  end

  def CommonUtils.get_gmap_city_marker(object)
    Gmaps4rails.build_markers(object) do |user, marker|
         marker.lat user.latitude
         marker.lng user.longitude
         marker.infowindow user.name
         # marker.title user.title
         marker.picture({
            :url => ActionController::Base.helpers.asset_path('marker_red.png'),
            :width   => 32,
            :height  => 32
            })
          marker.json({:id => user.id})
    end
  end


end