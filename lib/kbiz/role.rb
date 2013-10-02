module Kbiz
  class Role
    include Kbiz.initializer(:name, :job_description)

    def initialize(*)
      super
      raise ArgumentError if @name.nil? || @name == ''
      raise ArgumentError if @job_description.nil? || @job_description == ''
    end

    def revenue
      @revenue
    end
  end
end
