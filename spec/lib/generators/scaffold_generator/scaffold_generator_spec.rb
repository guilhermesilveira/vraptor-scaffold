require File.expand_path(File.dirname(__FILE__) + "/../../../spec_helper")

describe ScaffoldGenerator do
  
  before(:each) do
    @args = ["product", "name:String", "value:double"]
  end
  
  context "invalid scaffold command" do
    it "outside project root" do
      File.stub!(:exist?).with("pom.xml").and_return(false)
      Kernel.should_receive(:exit)
      ScaffoldGenerator.new(@args)
    end
    
    it "invalid attribute type" do
      File.stub!(:exist?).and_return(true)
      args = ["product", "name:string", "value:char"] 
      Kernel.should_receive(:exit)
      ScaffoldGenerator.new(args)
    end
  end
  
  context "valid scaffold command" do
    
    before(:each) do
      File.stub!(:exist?).and_return(true)
      @generator = ScaffoldGenerator.new(@args)
    
      @model_generator = mock(ModelGenerator)
      ModelGenerator.stub!(:new).with(@generator.model, @generator.attributes).and_return(@model_generator)
      
      @repository_generator = mock(RepositoryGenerator)
      RepositoryGenerator.stub!(:new).with(@generator.model, @generator.attributes).and_return(@repository_generator)
      
      @controller_generator = mock(ControllerGenerator)
      ControllerGenerator.stub!(:new).with(@generator.model, @generator.attributes).and_return(@controller_generator)
      
      @freemarker_generator = mock(FreemarkerGenerator)
      FreemarkerGenerator.stub!(:new).with(@generator.model, @generator.attributes).and_return(@freemarker_generator)
    
      @model_generator.stub!(:build)
      @repository_generator.stub!(:build)
      @controller_generator.stub!(:build)
      @freemarker_generator.stub!(:build)
  end
    
    it "should call model generator" do
      @model_generator.should_receive(:build)
      @generator.build
    end
    
    it "should call controller generator" do
      @controller_generator.should_receive(:build)
      @generator.build
    end
    
   it "should call freemarker generator" do
      @freemarker_generator.should_receive(:build)
      @generator.build
    end
    
    it "should call repository generator" do
      @repository_generator.should_receive(:build)
      @generator.build
    end
  end
end	
