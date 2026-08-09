class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260809.011654.9b96e03"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-011654-9b96e03/marvel-darwin-arm64"
    sha256 "0452fc6a583930c283dcc7f17d226a11192dc4e3df2eafd747524d0a1aa8556d"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-011654-9b96e03/marvel-darwin-amd64"
    sha256 "26fe3c3cd296ae5a49818bab71e9617544bf963808228a0c2373f344963549bb"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-011654-9b96e03/marvel-linux-arm64"
    sha256 "3aaa11900ba42dc87d23cd7774912c74064e64ffca243fcf5cfdd7eb2cf54f60"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260809-011654-9b96e03/marvel-linux-amd64"
    sha256 "da4aba7ba3408c0dc979c5a062ec0d73a1b0e316e4653e4f642ba1f8d84c632e"
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
