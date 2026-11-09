class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261109.170910.1ae402f"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-170910-1ae402f/marvel-darwin-arm64"
    sha256 "1fed5baac48108134c28ef9f8a71a7420720714c3ad1a630b240970f456e9b77"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-170910-1ae402f/marvel-darwin-amd64"
    sha256 "7ebdc7d7a6565ea8c338ad25651e92a7bfa5d7c1f830f64cc753cdda908cb568"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-170910-1ae402f/marvel-linux-arm64"
    sha256 "b39555732fb40798c4d6527fd38b8e8eda2eda5eb927cb5095078e62d288eb21"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261109-170910-1ae402f/marvel-linux-amd64"
    sha256 "11263ad2c3e4be1b0cb6729877aeb7201204738d0b8e89bb27b7be485e233ec7"
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
