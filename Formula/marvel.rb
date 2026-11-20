class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261120.062258.41c8dff"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-062258-41c8dff/marvel-darwin-arm64"
    sha256 "7d069c3b5f77c6340a4d1fd2eeb318fb9581936c9b746aa5b18b36b2d2948088"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-062258-41c8dff/marvel-darwin-amd64"
    sha256 "6e0cfe24a5dbfe420bb8d0ccc75d07d43e0ddca235c7b47988dd241c8db72c8a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-062258-41c8dff/marvel-linux-arm64"
    sha256 "eb32246fd81b3497e87724959161a167b39633ea05cc4991717c7686c52847fd"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261120-062258-41c8dff/marvel-linux-amd64"
    sha256 "eb4e831071d978dac9074cec7931402af953442bf4406fb9b0a7bc93fb4f6c14"
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
