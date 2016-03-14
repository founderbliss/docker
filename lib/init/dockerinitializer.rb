class DockerInitializer < DockerRunner
  def initialize(git_dir, env_vars, args, image_name = 'blissai/collector')
    @git_dir = git_dir
    @env_vars = env_vars
    @args = args
    @image_name = image_name
    @cmd = 'bliss-init'
  end

  def docker_start_cmd
    docker_cmd = 'docker run'
    mount_cmd = " -v #{@git_dir}:/repository"
    @env_vars.each do |k, v|
      docker_cmd += " -e \"#{k}=#{v}\""
    end
    collector_cmds = "ruby /root/collector/bin/#{@cmd} #{@args.join(' ')}"
    "#{docker_cmd} #{mount_cmd} --rm -t #{@image_name} #{collector_cmds}"
  end
end
