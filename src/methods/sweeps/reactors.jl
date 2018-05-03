function reactors(cur_sweep::AbstractSweep)
  cur_dict = Dict()

  cur_dict["beta"] = cur_sweep.beta_reactors
  cur_dict["kink"] = cur_sweep.kink_reactors
  cur_dict["pcap"] = cur_sweep.pcap_reactors
  cur_dict["wall"] = cur_sweep.wall_reactors
  cur_dict["heat"] = cur_sweep.heat_reactors

  cur_dict
end
