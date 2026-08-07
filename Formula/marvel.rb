class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260807.080302.d2cf942"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-080302-d2cf942/marvel-darwin-arm64"
    sha256 "7953acc24b9979e9ff282109c92142d6adcf4d88859500034ce3adc33f8d1dbc"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-080302-d2cf942/marvel-darwin-amd64"
    sha256 "4e9850dc6212e7f1450c277280d6f8871ce297387e5d1b444f6fe7c7c62e4d7d"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-080302-d2cf942/marvel-linux-arm64"
    sha256 "4cf25063d7720b0895c0cb863b9c2d851657674faaa2e0a9af0c1f1f9c7caa64"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-080302-d2cf942/marvel-linux-amd64"
    sha256 "9232b3bd266991d79a5d9139f4d3e54fe77815d5e80cc36d630d6d79ab74a998"
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
