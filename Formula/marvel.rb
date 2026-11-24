class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261124.063058.a357f80"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261124-063058-a357f80/marvel-darwin-arm64"
    sha256 "b5fa02ce0966c216a2628df16456f4fe08b66d19e57018fd1e4ccba720b3f7e3"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261124-063058-a357f80/marvel-darwin-amd64"
    sha256 "3c567224242d2acd2ad94187a4ffc44c75e95d8fc79dc394a5cd9171f2964cad"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261124-063058-a357f80/marvel-linux-arm64"
    sha256 "7da312dd1effeca77fcc5f696b31b73d025abb8713df1835862c94b21dcf2c01"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261124-063058-a357f80/marvel-linux-amd64"
    sha256 "649702a49a4ddd82d4c77673b556b0507a3ccd2f96f5042eeac055c0f7ea7699"
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
