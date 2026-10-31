class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261031.022151.664609e"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261031-022151-664609e/marvel-darwin-arm64"
    sha256 "7c3d883bfae28510178f65281a2feb3b1db2b81be34ea5e158b3221e1a434332"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261031-022151-664609e/marvel-darwin-amd64"
    sha256 "ecdb024dca3eed84a435408d2ce5e24bfa9430e18fe5bdf0bbee795e5f955248"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261031-022151-664609e/marvel-linux-arm64"
    sha256 "c1841a111272af9ff4cfa2ea3b396727f4025e09d82a278e7aac737489fccf26"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261031-022151-664609e/marvel-linux-amd64"
    sha256 "7a80efa30f68a94232ea3e9144815c8d54da60c93dc4609397b100cf444e1ef4"
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
