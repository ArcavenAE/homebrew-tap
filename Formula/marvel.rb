class Marvel < Formula
  desc "Agent orchestration control plane"
  homepage "https://github.com/ArcavenAE/marvel"
  version "0.1.0-alpha.20260904.161730.138211b"
  license "MIT"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260904-161730-138211b/marvel-darwin-arm64"
    sha256 "ad7654305f001f1df5f90e54ab8e98888f3f157251dcb97ea534a04e052fe12b"
  elsif OS.mac?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260904-161730-138211b/marvel-darwin-amd64"
    sha256 "7fbec0ade23982aab7dbe5ace3a3656aede3b08ebb6a68e3711feadd440d4f75"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260904-161730-138211b/marvel-linux-arm64"
    sha256 "fe6fe1fabf0773b76d13b6fbd5c6fa481049484088115dd8916776044ff8af2d"
  elsif OS.linux?
    url "https://github.com/ArcavenAE/marvel/releases/download/alpha-20260904-161730-138211b/marvel-linux-amd64"
    sha256 "e107aac4228a4fb1cd8618e1e664c86cf02d2edf86d6ab4e842a36b49defcc28"
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
