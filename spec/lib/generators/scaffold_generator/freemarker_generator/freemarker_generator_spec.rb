require File.expand_path(File.dirname(__FILE__) + "/../../../../spec_helper")

describe FreemarkerGenerator do
  
  before(:each) do
    @generator = FreemarkerGenerator.new("product", build_attributes)
    @generator.build
  end
  
  after(:each) do
    FileUtils.remove_dir("src") 
  end
  
  it "should create index view" do
    File.exist?("src/main/webapp/WEB-INF/views/product/index.ftl").should be_true 
  end
  
  it "should create show view" do
    File.exist?("src/main/webapp/WEB-INF/views/product/show.ftl").should be_true 
  end
  
  it "should create form view" do
    File.exist?("src/main/webapp/WEB-INF/views/product/form.ftl").should be_true 
  end
  
  it "should create new view" do
    File.exist?("src/main/webapp/WEB-INF/views/product/newProduct.ftl").should be_true 
  end
  
  it "should create edit view" do
    File.exist?("src/main/webapp/WEB-INF/views/product/edit.ftl").should be_true 
  end
  
end	
