class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260807.084537.4c5f22d"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-084537-4c5f22d/marvel-darwin-arm64"
    sha256 "43583879bdbf82ec95cfffb080e66260bb26c862f54476e9854020c3a9398754"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-084537-4c5f22d/marvel-darwin-amd64"
    sha256 "d855084d0554b222d190d6d7e6f72f1124295622b7db1809f013822bb7f9cb0b"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-084537-4c5f22d/marvel-linux-arm64"
    sha256 "48d0667b15724349b2bbf5b43fe3fd2f1f116d7ae2ef06b00f18d1c51a37852d"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260807-084537-4c5f22d/marvel-linux-amd64"
    sha256 "b16097cd56e7b5410324c4804598472f1bb7c7b247626b31d39a670be5f39dbe"
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
