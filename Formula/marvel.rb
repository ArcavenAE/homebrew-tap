class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260830.183517.164e229"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260830-183517-164e229/marvel-darwin-arm64"
    sha256 "f04305026025ae3d08c545d25778bdacc7182571ad31e86dbb7589bc84a4b250"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260830-183517-164e229/marvel-darwin-amd64"
    sha256 "98d5fd337af571b6b2b82ab3bd0f49f92ca2b21e131793c353e9486f10c54aa3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260830-183517-164e229/marvel-linux-arm64"
    sha256 "e3720ee35126758321824df71d8fb3b9ed80c975b920e15492b379d50cb27b53"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260830-183517-164e229/marvel-linux-amd64"
    sha256 "fc55bd31614a2eddb27bb6fca64e894f325c6b33a3f4319dde754b58d4015517"
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
