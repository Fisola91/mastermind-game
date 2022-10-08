[1mdiff --git a/spec/web_submit_spec.rb b/spec/web_submit_spec.rb[m
[1mindex f7b4587..f7b4650 100644[m
[1m--- a/spec/web_submit_spec.rb[m
[1m+++ b/spec/web_submit_spec.rb[m
[36m@@ -53,6 +53,7 @@[m [mRSpec.describe WebSubmit do[m
           subject = described_class.new(params)[m
           view = subject.view[m
           message = TurnMessage.for(view)[m
[32m+[m
         expect(message).to eq "Result message not implemented: #{view.inspect}"[m
       end[m
     end[m
