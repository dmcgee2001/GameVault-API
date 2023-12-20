module SeedDumpPatch
  def value_to_s(value)
    value = case value
      when BigDecimal, IPAddr
        value.to_s
      when Date, Time, DateTime
        value.to_s # Remove the :db argument from this line
      when Range
        range_to_string(value)
      when ->(v) { v.class.ancestors.map(&:to_s).include?("RGeo::Feature::Instance") }
        value.to_s
      else
        value
      end

    value.inspect
  end
end

SeedDump::DumpMethods.prepend(SeedDumpPatch)
