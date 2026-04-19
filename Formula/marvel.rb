class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260419.034700.20d90ac"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260419-034700-20d90ac/marvel-darwin-arm64"
    sha256 "14dc642a0913afa4f952bf9bd6a29e957e628a77e64874fcfbdde019ba7b8b98"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260419-034700-20d90ac/marvel-darwin-amd64"
    sha256 "cfcc172cc43f3793da709b9b58dbd2290ee184484146ffb6616a49f73c06e90f"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260419-034700-20d90ac/marvel-linux-arm64"
    sha256 "18a8e2536a405f9030691a65cf6bf6f3b550b5fbe446b032af500df453e3a384"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260419-034700-20d90ac/marvel-linux-amd64"
    sha256 "f64b4dd52741951671aa14da9d2ce7a418527294467d18b77c23efe14751309a"
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
