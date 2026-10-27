class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261027.212520.0dc43b9"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-212520-0dc43b9/marvel-darwin-arm64"
    sha256 "e4c86f3153ebf400e4cd01193ab159f6d8b01fcacd50c9ee1b52eb27b4373adf"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-212520-0dc43b9/marvel-darwin-amd64"
    sha256 "cda1065d5330bd1041658e2de5b92b07e417d88bb884b54d31e675bbc224cc8b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-212520-0dc43b9/marvel-linux-arm64"
    sha256 "1312d0ec55d8b06846b5151119a22791fc46feb723964b0d1a73da994bf5f975"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261027-212520-0dc43b9/marvel-linux-amd64"
    sha256 "3abb021138c86584748a5c84375d6216fe1c599ab1611b84976fb4254b2ccee1"
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
