class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260914.222257.06db065"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260914-222257-06db065/marvel-darwin-arm64"
    sha256 "39fe97d7575ff6988166c074f94c0f52bab8ba02321a60de5febe582493b4647"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260914-222257-06db065/marvel-darwin-amd64"
    sha256 "1d63bcda19926a596fe74e80edbabd3ea381ff682b8b0adcd9d442e3fb53253a"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260914-222257-06db065/marvel-linux-arm64"
    sha256 "a977caea41a44665cd7b5ea202569fa4e3060b7dbf71926c5d1b7f7d0f63d358"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260914-222257-06db065/marvel-linux-amd64"
    sha256 "9ff962469ab8b8dde083ade2a9022a1295406f7dd5cc08e7f4a8784ab920c00d"
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
