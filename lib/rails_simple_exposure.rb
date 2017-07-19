module RailsSimpleExposure
  def expose(name, value)
    instance_variable_name = "@#{name}"

    define_method name do
      return instance_variable_get instance_variable_name if instance_variable_defined? instance_variable_name
      instance_variable_set instance_variable_name, instance_eval(&value)
    end

    define_method :"#{name}=" do |value|
      instance_variable_set instance_variable_name, value
    end

    private :"#{name}="
    helper_method name
  end
end

ActionController::Base.send :extend, RailsSimpleExposure