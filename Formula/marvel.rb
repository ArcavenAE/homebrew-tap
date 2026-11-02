class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261102.142031.b84922c"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-142031-b84922c/marvel-darwin-arm64"
    sha256 "b7437b6e9613ebe355c8ff375f52fc10d4c273ca738719211e1dc3266114c9c0"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-142031-b84922c/marvel-darwin-amd64"
    sha256 "766301fc11e81033bdd06eb727bb0166057fd1a3512646ac5f626d178e1a4495"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-142031-b84922c/marvel-linux-arm64"
    sha256 "bcd5e04dfce77bba708ee5b300d5ae4c3c57016dc432898bed22c316c22df896"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261102-142031-b84922c/marvel-linux-amd64"
    sha256 "8a5f02b990f5e16c4fe41b7d5ec4cfc55d5aa2634e6646c4b7412a00cb12832a"
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
