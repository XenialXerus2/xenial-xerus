module Support::CheckAttr
  def check_attr(attr)
    if attr.in? [:fgm, :yds, :comp_pct]
      attr
    else
      raise "invalid attribute, should be one of :fgm, :yds, :comp_pct"
    end
  end
  
  def expected_score(attr)
    case attr
    when :fgm
      0
    when :yds
      10
    when :comp_pct
      70
    end
  end
end