class Phill::Location < DelegateClass(RecursiveOpenStruct)
  def files
    @files ||= super.map { |f| Phill::File.new(f) }
  end
end
