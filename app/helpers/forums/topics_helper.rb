module Forums::TopicsHelper

  def js_for_monitor
    script = "if (this.checked) {
                #{remote_function :url => forums_forum_topic_monitorship_path(@forum, @topic)}
              } else {
                #{remote_function :url => forums_forum_topic_monitorship_path(@forum, @topic), :method => :delete}
              }"
  end

  def  additional_js
    script = "$(document).ready(function() {
                $('#reply_to').click(function(event){
                  event.preventDefault();
                  created = $('#reply').append('#{escape_javascript(render :partial => "reply")}');
                });
              });"
  end
end
