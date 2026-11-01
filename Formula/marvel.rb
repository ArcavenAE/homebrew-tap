class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261101.025552.ac0aad5"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-025552-ac0aad5/marvel-darwin-arm64"
    sha256 "9732ba5e9b0d6653dd4032c35f6c0adb881a375fd3c7aac3f3662f9ee5eea34f"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-025552-ac0aad5/marvel-darwin-amd64"
    sha256 "7a76fa9eb723c8e4a210614ff3a29862dc9f9dc21ab0251731aa31365efb56ee"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-025552-ac0aad5/marvel-linux-arm64"
    sha256 "9d23964bdb40e38149906619f09b8ddefde5ebcbb2141f905d1e330a0b176b7a"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261101-025552-ac0aad5/marvel-linux-amd64"
    sha256 "0ea1d3228da14d310bd4b9629a8909e04df1c49a18bd17c077f14375b3bf0fa5"
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
