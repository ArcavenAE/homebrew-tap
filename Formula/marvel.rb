class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261004.183409.9ae80e6"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-183409-9ae80e6/marvel-darwin-arm64"
    sha256 "7974a55eb27b3919f6c4f0f85b76d3af92c7afce48ed2864917cb5b53912c8eb"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-183409-9ae80e6/marvel-darwin-amd64"
    sha256 "3fc41a6dc643c98daed5ca5da30c3940b95a82bec37a916ebaf7749b1ff6b96e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-183409-9ae80e6/marvel-linux-arm64"
    sha256 "eb6d5c15a1a74d94e4abc53de6e82e51d0052a2c2f42ef3cead7e5b3f44e5594"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261004-183409-9ae80e6/marvel-linux-amd64"
    sha256 "58392708395897b5eb0c1656a5b68cba52f83ded735ade268cc06ea24beb0bbf"
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
