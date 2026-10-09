class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261009.191010.7561643"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-191010-7561643/marvel-darwin-arm64"
    sha256 "f68fe182121dab63770820637f73b580773a937d98e49acc95777004cf9cf1ee"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-191010-7561643/marvel-darwin-amd64"
    sha256 "706efd5dd0c8a0cfe025deeed178eb2f54489d6a590f1ce78c628f3793ef0620"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-191010-7561643/marvel-linux-arm64"
    sha256 "0e852694c0b99f18169c8df1402f09520f6ed6a534261ab85b59319a4e322d4d"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261009-191010-7561643/marvel-linux-amd64"
    sha256 "903472f63afde2e55f6dd08b35608a3a1535b44cfa62510b1b595d2c03a74d5e"
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
