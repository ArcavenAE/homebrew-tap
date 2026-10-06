class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20261006.171928.eb7f459"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-171928-eb7f459/marvel-darwin-arm64"
    sha256 "ba33cf7463c9ac50171baad9d968d0025ce7f0a10cf3401c16e3c7b591cae351"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-171928-eb7f459/marvel-darwin-amd64"
    sha256 "0963fc64186dc97eadd8b5cb95d5267c41c3fbae86ed3f34b6061a103946b02f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-171928-eb7f459/marvel-linux-arm64"
    sha256 "78a286f9a8391a45672fdf41ea41b8a99ccba4cba1b3e8a88b4bfb4713161446"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20261006-171928-eb7f459/marvel-linux-amd64"
    sha256 "2730c92315376d3727f7516d8ef51cc8586ea96ee2163cf3ba9e2ecc2066695d"
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
