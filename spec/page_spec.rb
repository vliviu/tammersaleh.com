#!/bin/env rspec

require "spec_helper"

describe "Given a file with front matter commented by //" do
  before do
    @path = "file"
    create_template("#{@path}.html.haml", 
                    <<-EOF)
                      // ---
                      // title: "Title for this post."
                      // ---
                      This is a post.
                    EOF
  end

  describe "Page.new(filename)" do
    before { @page = Page.new(@path) }

    describe "#front_matter" do
      before { @out = @page.front_matter }

      it "returns a HashWithIndifferentAccess" do
        @out.should be_a(HashWithIndifferentAccess)
      end

      it "returns the title in the hash" do
        @out[:title].should == "Title for this post."
      end
    end
  end
end

# describe "Given a file without front matter" do
#   include FrontMatter
#   before do
#     create_template("file", "This is a post.")
#   end
# 
#   describe "front_matter_from_file(filename)" do
#     before do
#       @out = front_matter_from_file(File.join(TammerSaleh.settings.views, "file"))
#     end
# 
#     it "returns a HashWithIndifferentAccess" do
#       @out.should be_a(HashWithIndifferentAccess)
#     end
# 
#     it "returns empty hash" do
#       @out.should be_empty
#     end
#   end
# end
# 
