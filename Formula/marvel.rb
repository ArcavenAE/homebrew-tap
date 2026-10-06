class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261006.185754.156a115"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-185754-156a115/marvel-darwin-arm64"
    sha256 "b0536f094b736203fb992327d7b51562f59f3f2d0f8c71119aeea9479bb035f7"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-185754-156a115/marvel-darwin-amd64"
    sha256 "c5e0ce271ef8ae354b30fef7172e642a52393e25660c3b604cba87ed0ed30821"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-185754-156a115/marvel-linux-arm64"
    sha256 "f641fe472715dbfc1fc1b6d9c68f7f99356a59f0f88150ed2a7453269b06183f"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-185754-156a115/marvel-linux-amd64"
    sha256 "917d46ca80ef17dfa5d7e116757d5ddb9abacd98fc672109a25c4d9ceaadacb0"
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
