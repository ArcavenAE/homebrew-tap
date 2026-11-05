class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261105.063532.f9a2785"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-063532-f9a2785/marvel-darwin-arm64"
    sha256 "ee22a16889682c69630e5dee4e44ca2ebfcd4fd02eee07696eb7f7919ea85218"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-063532-f9a2785/marvel-darwin-amd64"
    sha256 "99059b1aa3091d8c105b2270a8a2297497fc3b569d2cd0d0417a608053948e04"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-063532-f9a2785/marvel-linux-arm64"
    sha256 "d2af6b07efadbde9251afc6a4ea023600260c0151e7cb2b0eb1e3e716c0db009"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261105-063532-f9a2785/marvel-linux-amd64"
    sha256 "8c6f3fd90437793bed0e138378cbd2319fef7d8244f96cb73cf86c4d32aed866"
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
