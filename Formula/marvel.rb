class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261008.133535.18d5dd8"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-133535-18d5dd8/marvel-darwin-arm64"
    sha256 "bb65266344daf5b65c58ffcabde6cc842250f33711d99ef1b01a67f3ca02adf4"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-133535-18d5dd8/marvel-darwin-amd64"
    sha256 "6de1893ad19992f287881695057cd1c5323f060f615b5f4cfab7c46ddb33e299"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-133535-18d5dd8/marvel-linux-arm64"
    sha256 "b912b0691818fc737f650e7962e835ad26ddac0fee61ef3e2311f3a12b12e584"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261008-133535-18d5dd8/marvel-linux-amd64"
    sha256 "99151ebf5346440e86728cc7e61bebc59ce2cb5cd0d16634aa6dfe1ce84efe70"
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "marvel-darwin-arm64" => "marvel"
    elsif OS.mac?
      bin.install "marvel-darwin-amd64" => "marvel"
    elsif OS.linux? && Hardware::CPU.arm?
      bin.install "marvel-linux-arm64" => "marvel"
    elsif OS.linux?
      bin.install "marvel-linux-amd64" => "marvel"
    end
  end

  test do
    assert_match "marvel", shell_output("#{bin}/marvel version 2>&1")
  end
end
